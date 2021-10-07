// To parse this JSON data, do
//
//     final responseOdooModel = responseOdooModelFromJson(jsonString);

import 'dart:convert';

OdooAuthResponseModel responseOdooModelFromJson(String str) =>
    OdooAuthResponseModel.fromJson(json.decode(str));

String responseOdooModelToJson(OdooAuthResponseModel data) =>
    json.encode(data.toJson());

class OdooAuthResponseModel {
  OdooAuthResponseModel({this.jsonrpc, this.id, this.result, this.error});

  String? jsonrpc;
  dynamic? id;
  Result? result;
  Error? error;

  factory OdooAuthResponseModel.fromJson(Map<String, dynamic> json) =>
      OdooAuthResponseModel(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: json["result"] != null ? Result.fromJson(json["result"]) : null,
        error: json["error"] != null ? Error.fromMap(json["error"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result!.toJson(),
        "error": error!.toMap(),
      };
}

class Result {
  Result({
    this.uid,
    this.isSystem,
    this.isAdmin,
    this.userContext,
    this.db,
    this.serverVersion,
    this.serverVersionInfo,
    this.name,
    this.username,
    this.partnerDisplayName,
    this.companyId,
    this.partnerId,
    this.webBaseUrl,
    this.activeIdsLimit,
    this.maxFileUploadSize,
    this.userCompanies,
    this.currencies,
    this.showEffect,
    this.displaySwitchCompanyMenu,
    this.cacheHashes,
    this.userId,
    this.maxTimeBetweenKeysInMs,
    this.webTours,
    this.notificationType,
    this.odoobotInitialized,
  });

  int? uid;
  bool? isSystem;
  bool? isAdmin;
  UserContext? userContext;
  String? db;
  String? serverVersion;
  List<dynamic>? serverVersionInfo;
  String? name;
  String? username;
  String? partnerDisplayName;
  int? companyId;
  int? partnerId;
  String? webBaseUrl;
  int? activeIdsLimit;
  int? maxFileUploadSize;
  UserCompanies? userCompanies;
  Map<String, Currency>? currencies;
  String? showEffect;
  bool? displaySwitchCompanyMenu;
  CacheHashes? cacheHashes;
  List<int>? userId;
  int? maxTimeBetweenKeysInMs;
  List<dynamic>? webTours;
  String? notificationType;
  bool? odoobotInitialized;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uid: json["uid"],
        isSystem: json["is_system"],
        isAdmin: json["is_admin"],
        userContext: UserContext.fromJson(json["user_context"]),
        db: json["db"],
        serverVersion: json["server_version"],
        serverVersionInfo:
            List<dynamic>.from(json["server_version_info"].map((x) => x)),
        name: json["name"],
        username: json["username"],
        partnerDisplayName: json["partner_display_name"],
        companyId: json["company_id"],
        partnerId: json["partner_id"],
        webBaseUrl: json["web.base.url"],
        activeIdsLimit: json["active_ids_limit"],
        maxFileUploadSize: json["max_file_upload_size"],
        userCompanies: UserCompanies.fromJson(json["user_companies"]),
        currencies: Map.from(json["currencies"])
            .map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
        showEffect: json["show_effect"],
        displaySwitchCompanyMenu: json["display_switch_company_menu"],
        cacheHashes: CacheHashes.fromJson(json["cache_hashes"]),
        userId: List<int>.from(json["user_id"].map((x) => x)),
        maxTimeBetweenKeysInMs: json["max_time_between_keys_in_ms"],
        webTours: List<dynamic>.from(json["web_tours"].map((x) => x)),
        notificationType: json["notification_type"],
        odoobotInitialized: json["odoobot_initialized"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "is_system": isSystem,
        "is_admin": isAdmin,
        "user_context": userContext!.toJson(),
        "db": db,
        "server_version": serverVersion,
        "server_version_info":
            List<dynamic>.from(serverVersionInfo!.map((x) => x)),
        "name": name,
        "username": username,
        "partner_display_name": partnerDisplayName,
        "company_id": companyId,
        "partner_id": partnerId,
        "web.base.url": webBaseUrl,
        "active_ids_limit": activeIdsLimit,
        "max_file_upload_size": maxFileUploadSize,
        "user_companies": userCompanies!.toJson(),
        "currencies": Map.from(currencies!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "show_effect": showEffect,
        "display_switch_company_menu": displaySwitchCompanyMenu,
        "cache_hashes": cacheHashes!.toJson(),
        "user_id": List<dynamic>.from(userId!.map((x) => x)),
        "max_time_between_keys_in_ms": maxTimeBetweenKeysInMs,
        "web_tours": List<dynamic>.from(webTours!.map((x) => x)),
        "notification_type": notificationType,
        "odoobot_initialized": odoobotInitialized,
      };
}

class CacheHashes {
  CacheHashes({
    this.loadMenus,
    this.qweb,
    this.translations,
  });

  String? loadMenus;
  String? qweb;
  String? translations;

  factory CacheHashes.fromJson(Map<String, dynamic> json) => CacheHashes(
        loadMenus: json["load_menus"],
        qweb: json["qweb"],
        translations: json["translations"],
      );

  Map<String, dynamic> toJson() => {
        "load_menus": loadMenus,
        "qweb": qweb,
        "translations": translations,
      };
}

class Currency {
  Currency({
    this.symbol,
    this.position,
    this.digits,
  });

  String? symbol;
  String? position;
  List<int>? digits;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        symbol: json["symbol"],
        position: json["position"],
        digits: List<int>.from(json["digits"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "position": position,
        "digits": List<dynamic>.from(digits!.map((x) => x)),
      };
}

class UserCompanies {
  UserCompanies({
    this.currentCompany,
    this.allowedCompanies,
  });

  List<dynamic>? currentCompany;
  List<List<dynamic>>? allowedCompanies;

  factory UserCompanies.fromJson(Map<String, dynamic> json) => UserCompanies(
        currentCompany:
            List<dynamic>.from(json["current_company"].map!((x) => x)),
        allowedCompanies: List<List<dynamic>>.from(json["allowed_companies"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "current_company": List<dynamic>.from(currentCompany!.map((x) => x)),
        "allowed_companies": List<dynamic>.from(
            allowedCompanies!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class UserContext {
  UserContext({
    this.lang,
    this.tz,
    this.uid,
  });

  String? lang;
  String? tz;
  int? uid;

  factory UserContext.fromJson(Map<String, dynamic> json) => UserContext(
        lang: json["lang"],
        tz: json["tz"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "tz": tz,
        "uid": uid,
      };
}

class Error {
  Error({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory Error.fromMap(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.name,
    this.debug,
    this.message,
    this.arguments,
    this.context,
  });

  String? name;
  String? debug;
  String? message;
  List<String>? arguments;
  Context? context;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        name: json["name"],
        debug: json["debug"],
        message: json["message"],
        arguments: List<String>.from(json["arguments"].map((x) => x)),
        context: Context.fromMap(json["context"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "debug": debug,
        "message": message,
        "arguments": List<dynamic>.from(arguments!.map((x) => x)),
        "context": context!.toMap(),
      };
}

class Context {
  Context();

  factory Context.fromMap(Map<String, dynamic> json) => Context();

  Map<String, dynamic> toMap() => {};
}
