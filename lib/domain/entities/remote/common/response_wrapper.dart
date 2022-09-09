


import 'package:footballer/domain/entities/remote/common/response_type.dart';

class ResponseWrapper<T> {
  ResponseWrapper({
    this.code,
    this.responseType,
    this.message,
    this.response,
    this.hasError,
  });

  ResponseType? responseType;
  int? code;
  String? message;
  T? response;
  bool? hasError;

  factory ResponseWrapper.fromJson(
          Map<String, dynamic> json, Function(Map<String, dynamic>) create) =>
      ResponseWrapper(
        code: json["statusCode"],
        message: json["message"],
        response: json["data"] == null ? null : create(json['data']),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": code,
        "message": message,
        "data": response,
      };
}
