import 'dart:io';

import 'package:odoo_movil/env/environment.dart';
import 'package:dio/dio.dart';

class DioApi {
  //static Dio _dio = new Dio();
  final Dio client;
  DioApi(this.client) {
    client.options.baseUrl = URL_API;
    client.options.headers[HttpHeaders.contentTypeHeader] = "application/json";
  }

  // static void configureDio() {
  //   //Base del url
  //   _dio.options.baseUrl =

  //   // Configuración del

  //   //_dio.options.headers[HttpHeaders.cookieHeader]
  //   //_dio.options.headers[HttpHeaders.authorizationHeader] =
  //   //    'Bearer ' + (LocalStorage.prefs.getString('token') ?? '');
  // }

  // static Future httpGet(String path) async {
  //   try {
  //     final resp = await _dio.get(path);
  //     return resp.data;
  //   } catch (e) {
  //     print(e);
  //     throw ('Error en el Get');
  //   }
  // }

  /*static Future httpPost(String path, Map<String, dynamic> data) async {
    //final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: data);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el Post');
    }
  }*/
}
