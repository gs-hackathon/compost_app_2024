import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:compost_app_2024/utils/base_url.dart';

class RequestHelper extends http.BaseClient {
  final http.Client _httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    request.headers.addAll({
      'x-access-token': sp.getString("access_token") ?? "",
    });
    return _httpClient.send(request);
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    return _sendUnstreamed('POST', url, headers!, body, encoding!);
  }

  @override
  Future<http.Response> _sendUnstreamed(
      String method, url, Map<String, String> headers,
      [body, Encoding? encoding]) async {
    var request = http.Request(method, _fromUriOrString(url));

    request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }
    var responseData = await http.Response.fromStream(await send(request));
    logRequest(responseData, body);
    return responseData;
  }

  void logRequest(http.Response responseData, body) {
    print('\x1B[52m\x1B[0m');
    print('\x1B[95m${responseData.request} ${responseData.statusCode}\x1B[0m');
    print('\x1B[36m$body\x1B[0m');
    print('\x1B[34m${responseData.body}\x1B[0m');
    print('\x1B[52m\x1B[0m');
  }

  Uri _fromUriOrString(uri) => uri is String ? Uri.parse(uri) : uri as Uri;

  Uri url(String urlPath) {
    final url = baseUrl + urlPath;
    return Uri.parse(url);
  }
}
