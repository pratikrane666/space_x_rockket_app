import 'dart:convert';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:http/http.dart' as Http;

class ApiClient extends GetxService {
  final String appBaseUrl;
  ApiClient({
    required this.appBaseUrl,
  });
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  Future<Response> getData(String uri) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri');
      }
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl + uri),
      ).timeout(Duration(seconds: timeoutInSeconds));
      print(_response.body);
      return handleResponse(_response, uri);
    } catch (e) {
      print('------------${e.toString()}');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Future<Response> postData(String uri, dynamic body, {Map<String, String> headers}) async {
  //   try {
  //     if(Foundation.kDebugMode) {
  //       print('====> API Call: $uri\nHeader: $_mainHeaders');
  //       print('====> API Body: $body');
  //     }
  //     Http.Response _response = await Http.post(
  //       Uri.parse(appBaseUrl+uri),
  //       body: jsonEncode(body),
  //       headers: headers ?? _mainHeaders,
  //     ).timeout(Duration(seconds: timeoutInSeconds));
  //     return handleResponse(_response, uri);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }

  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}
    Response _response = Response(
      body: _body != null ? _body : response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (_response.statusCode != 200 &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().startsWith('{errors: [{code:')) {
        // ErrorResponse _errorResponse = ErrorResponse.fromJson(_response.body);
        _response = Response(
          statusCode: _response.statusCode,
          body: _response.body,
        );
      } else if (_response.body.toString().startsWith('{message')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);
      }
    } else if (_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    if (Foundation.kDebugMode) {
      print(
          '====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    }
    return _response;
  }
}
