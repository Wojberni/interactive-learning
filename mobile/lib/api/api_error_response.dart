import 'dart:convert';

class ApiErrorResponse {
  String timestamp = "";
  int status = 0;
  String message = "";
  String errorCode = "";

  ApiErrorResponse();

  fromRawError(String rawError) {
    var errorBody = json.decode(rawError);
    _fromJson(errorBody);
  }
  _fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status = json['status'];
    message = json['message'];
    errorCode = json['errorCode'];
  }
}