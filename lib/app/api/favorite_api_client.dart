import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoriteApiClient extends Disposable {
  Dio _dioClient;
  Options? _headers;

  FavoriteApiClient(this._dioClient) {
    _dioClient.options.baseUrl =
        "http://private-782d3-starwarsfavorites.apiary-mock.com";
  }

  Future<void> addFavorito(int? charactersId) async {
    Response response = await sendPost(rota: "/api/favorite/?id=$charactersId");
    if (response.statusCode == 200) {
      return null;
    } else {
      return null;
    }
  }

  Future<Response> sendPost({required String rota, String body = ""}) async {
    return _dioClient.post(
      rota,
      data: body,
      options: _headers,
    );
  }

  @override
  void dispose() {}
}
