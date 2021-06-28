import 'package:dio/dio.dart';

import 'package:desafio_flutter/models/character_model.dart';

class ApiClient {
  Dio _dioClient = new Dio();
  Response? response;

  Future getCharacters() async {
    response = await _dioClient.get("https://swapi.dev/api/people/");
    if (response!.statusCode == 200) {
      return CharactersModel.fromJson(response!.data!);
    }
    return null;
  }
}
