import 'package:desafio_flutter/models/characters_response.dart';
import 'package:dio/dio.dart';

class ApiClient {
  Dio _dioClient;
  Response? response;

  ApiClient(
    this._dioClient,
  ) {
    _dioClient.options.baseUrl = "https://swapi.dev";
    _dioClient.options.connectTimeout = 5000; //5s
    _dioClient.options.receiveTimeout = 3000;
  }

  Future<CharactersResponse?> getCharacters() async {
    try {
      response = await _dioClient.get("/api/people/");
      if (response!.statusCode == 200) {
        return CharactersResponse.fromMap(response!.data!);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
