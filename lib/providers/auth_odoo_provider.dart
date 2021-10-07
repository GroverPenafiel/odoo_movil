import 'dart:io';

import 'package:dio/dio.dart';
import 'package:odoo_movil/api/dio_api.dart';
import 'package:odoo_movil/env/environment.dart';
import 'package:odoo_movil/models/http/auth_response.dart';
import 'package:flutter/material.dart';
import 'package:odoo_movil/models/http/odoo_auth_response.dart';
import 'package:odoo_movil/router/router.dart';
import 'package:odoo_movil/services/local_storage.dart';
import 'package:odoo_movil/services/navigation_service.dart';
import 'package:odoo_movil/services/notification_service.dart';

enum AuthOdooStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthOdooProvider extends ChangeNotifier {
  String? _token;
  AuthOdooStatus authStatus = AuthOdooStatus.checking;
  Usuario? user;
  bool cargando = false;
  AuthOdooProvider() {
    this.isAuthenticate();
  }

  login(String email, String password) async {
    DioApi _dio = DioApi(new Dio());
    this.cargando = true;
    notifyListeners();

    final data = {
      'jsonrpc': '2.0',
      'params': {'db': DB_API, 'login': email, 'password': password}
    };

    try {
      Response response =
          await _dio.client.post('/web/session/authenticate', data: data);
      final cookie = response.headers.map['set-cookie'];
      final authResponse = OdooAuthResponseModel.fromJson(response.data);

      if (authResponse.error != null) {
        authStatus = AuthOdooStatus.notAuthenticated;
        this.cargando = false;
        notifyListeners();
        if (authResponse.error!.code == 200 &&
            authResponse.error!.data!.message == 'Access Denied') {
          NotificationService.showSnackbarError('Credenciales no validas');
        } else {
          NotificationService.showSnackbarError(
              'Se produjo un error en el Servidor');
        }
      } else {
        _actualizarCookieSesion(cookie![0]);
        user = new Usuario(
            idUsuario: authResponse.result!.username == null
                ? ''
                : authResponse.result!.username!,
            idIniciosesion: 0,
            nombreCompleto: authResponse.result!.username == null
                ? ''
                : authResponse.result!.name!,
            nombreUsuario: authResponse.result!.username!,
            correoElectronico: authResponse.result!.username!,
            modificarPassword: false);
        authStatus = AuthOdooStatus.authenticated;

        NavigationService.replaceTo(Flurorouter.dashboardRoute);

        this.cargando = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      {
        // final messageResponse = MessageResponse.fromMap(json);
        // NotificationService.showSnackbarError(messageResponse.message);
        authStatus = AuthOdooStatus.notAuthenticated;
        this.cargando = false;
        notifyListeners();
      }
    } on Error catch (e) {
      this.cargando = false;
      notifyListeners();
      print('Error en: $e');
      NotificationService.showSnackbarError('Credencial no valida');
    }
    ;
  }

  Future<bool> isAuthenticate() async {
    DioApi _dio = DioApi(new Dio());
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      this.authStatus = AuthOdooStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await _dio.client.get('/Login/Auth');
      final messageResponse = MessageResponse.fromMap(resp.data);
      if (!messageResponse.ok) {
        authStatus = AuthOdooStatus.notAuthenticated;
        notifyListeners();
        return false;
      } else {
        authStatus = AuthOdooStatus.authenticated;
        notifyListeners();
        return true;
      }
    } catch (e) {
      authStatus = AuthOdooStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthOdooStatus.notAuthenticated;
    notifyListeners();
  }

  // Take new session from cookies and update session instance
  void _actualizarCookieSesion(String cookiesStr) {
    // see https://github.com/dart-lang/http/issues/362
    final look_for_comma_expression = RegExp(r'(?<=)(,)(?=[^;]+?=)');

    for (final cookieStr in cookiesStr.split(look_for_comma_expression)) {
      try {
        final cookie = Cookie.fromSetCookieValue(cookieStr);
        if (cookie.name == 'session_id') {
          LocalStorage.prefs.setString('session_id', cookie.value);
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    }
  }
}
