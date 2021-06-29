import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/app/api/api_client.dart';
import 'package:desafio_flutter/models/character_model.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc extends BlocBase {
  final _characters = PublishSubject<List<CharactersModel>>();
  String _proximaPagina = "";

  @override
  void dispose() {
    super.dispose();
    _characters.close();
  }

  final ApiClient _repo;

  CharacterBloc(this._repo) {
    getCharacters();
  }

  Stream<List<CharactersModel>> get characters => _characters.stream;

  Future getCharacters() async {
    var usuario = await _repo.getCharacters();
    _characters.add(usuario!.results!);
    return usuario;
  }

  Future getProximaPagina() async {}
}
