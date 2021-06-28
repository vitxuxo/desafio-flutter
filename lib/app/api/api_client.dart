import 'package:dio/dio.dart';

import 'package:desafio_flutter/models/character_model.dart';

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

  Future<CharactersModel?> getCharacters() async {
    try {
      response = await _dioClient.get("/api/people/");
      if (response!.statusCode == 200) {
        return CharactersModel.fromMap(response!.data!);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
