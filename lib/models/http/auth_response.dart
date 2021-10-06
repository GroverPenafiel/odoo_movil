// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);
import 'dart:convert';

AuthResponse authResponseFromMap(String str) =>
    AuthResponse.fromMap(json.decode(str));

String authResponseToMap(AuthResponse data) => json.encode(data.toMap());

class AuthResponse {
  AuthResponse({
    required this.message,
    required this.ok,
    required this.token,
    required this.id,
    required this.expiresIn,
  });

  String message;
  bool ok;
  String token;
  String id;
  int expiresIn;

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        message: json["message"],
        ok: json["ok"],
        token: json["token"],
        id: json["id"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "ok": ok,
        "token": token,
        "id": id,
        "expires_in": expiresIn,
      };
}

// class AuthResponse {
//   AuthResponse({required this.usuario, required this.token, required this.ok});

//   Usuario usuario;
//   String token;
//   bool ok;

//   factory AuthResponse.fromJson(String str) =>
//       AuthResponse.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
//         usuario: Usuario.fromMap(json["usuario"]),
//         token: json["token"],
//         ok: json["ok"],
//       );

//   Map<String, dynamic> toMap() => {
//         "usuario": usuario.toMap(),
//         "token": token,
//         "ok": ok,
//       };
// }

class Usuario {
  Usuario({
    required this.idUsuario,
    required this.idIniciosesion,
    required this.nombreCompleto,
    required this.nombreUsuario,
    required this.correoElectronico,
    required this.modificarPassword,
  });

  String idUsuario;
  int idIniciosesion;
  String nombreCompleto;
  String nombreUsuario;
  String correoElectronico;
  bool modificarPassword;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        idUsuario: json["id_usuario"],
        idIniciosesion: json["id_iniciosesion"],
        nombreCompleto: json["nombre_completo"],
        nombreUsuario: json["nombre_usuario"],
        correoElectronico: json["correo_electronico"],
        modificarPassword: json["modificar_password"],
      );

  Map<String, dynamic> toMap() => {
        "id_usuario": idUsuario,
        "id_iniciosesion": idIniciosesion,
        "nombre_completo": nombreCompleto,
        "nombre_usuario": nombreUsuario,
        "correo_electronico": correoElectronico,
        "modificar_password": modificarPassword,
      };
}

//////////////////////////////////////
class MessageResponse {
  MessageResponse({required this.message, required this.ok});

  String message;
  bool ok;

  factory MessageResponse.fromJson(String str) =>
      MessageResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageResponse.fromMap(Map<String, dynamic> json) => MessageResponse(
        message: json["message"],
        ok: json["ok"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "ok": ok,
      };
}
