import 'package:dio/dio.dart';

class FavoriteApiClient {
  Dio _dioClient = new Dio();
  Response? response;

  Future<void> addFavorito(int? charactersId) async {
    try {
      response = await _dioClient.post(
        "http://private-782d3-starwarsfavorites.apiary-mock.com/api/favorite/",
        data: {'id': '$charactersId'},
      );
      if (response!.statusCode == 200) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
