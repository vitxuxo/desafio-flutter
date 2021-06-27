import 'package:desafio_flutter/models/character_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ApiClient extends Disposable {
  Dio _dioClient;
  Options? _headers;

  ApiClient(this._dioClient) {
    _dioClient.options.baseUrl = "https://swapi.dev";
    _headers = Options(headers: {"Content-Type": "application/json"});
  }

  Future<CharactersModel?> getCharacters() async {
    Response response = await sendGet(rota: "/api/people/");
    if (response.statusCode == 200) {
      return CharactersModel.fromMap(response.data!);
    }
    return null;
  }

  Future<Response> sendGet({required String rota}) async {
    return _dioClient.get(
      rota,
      options: _headers,
    );
  }

  Future<Response> sendPut({required String rota, String body = ""}) async {
    return _dioClient.put(
      rota,
      options: _headers,
      data: body,
    );
  }

  Future<Response> sendDelete({required String rota, String body = ""}) async {
    return _dioClient.delete(
      rota,
      options: _headers,
      data: body,
    );
  }

  @override
  void dispose() {}
}
