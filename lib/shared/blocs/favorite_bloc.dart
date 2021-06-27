import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/app/api/favorite_api_client.dart';
import 'package:desafio_flutter/models/character_model.dart';
import 'package:rxdart/rxdart.dart';

class FavoritesBloc extends BlocBase {
  final _favoritos = BehaviorSubject<List<CharactersModel>?>();
  final _listaFavoritos = <CharactersModel>[];

  @override
  void dispose() {
    super.dispose();
    _favoritos.close();
  }

  final FavoriteApiClient _repo;

  FavoritesBloc(this._repo) {
    getFavoritos();
  }

  Stream<List<CharactersModel>?> get favoritos => _favoritos.stream;

  void addFavorito(CharactersModel charactersModel) {
    _repo.addFavorito(charactersModel.id);
    _listaFavoritos.add(charactersModel);
    _favoritos.add(_listaFavoritos);
  }

  Future getFavoritos() async {
    // _listaFavoritos.addAll(favoritos);
    _favoritos.add(_listaFavoritos);
  }
}
