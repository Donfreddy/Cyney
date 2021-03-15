import 'dart:convert';

import 'package:cyney/core/error/custom_exception.dart';
import 'package:cyney/src/utils/constant.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  /// This class is not meant to be instantiated or extended.
  /// this constructor prevents(empeche) instantiation and extension.
  HttpClient._privateConstructor();

  /// We use the singleton pattern to ensure that we have only
  /// one class instance and provide a global point access to it.
  static final HttpClient _instance = HttpClient._privateConstructor();

  factory HttpClient() {
    return _instance;
  }

  Future<dynamic> get(String url) async {
    var lang = 'en';
    var finalUrl = BASE_URL + url + 'api_key=$API_KEY&language=$lang';

    final response = await http.get(finalUrl);

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
        break;
      case 401:
        throw BadRequestException(
            'Invalid API key: You must be granted a valid key.');
      case 404:
        throw ServerException('The resource you requested could not be found.');
      default:
        throw UnknownException('StatusCode : ${response.statusCode}');
    }
  }
}
