import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:desafio_flutter/screens/home_screen.dart';
import 'package:desafio_flutter/shared/blocs/character_bloc.dart';
import 'package:desafio_flutter/shared/blocs/favorite_bloc.dart';
import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'package:desafio_flutter/app/api/api_client.dart';
import 'package:desafio_flutter/app/api/favorite_api_client.dart';

class AppModule extends ModuleWidget {
  @override
  List<Dependency> get dependencies => [
        Dependency(
          (i) => ApiClient(
            new Dio(),
          ),
        ),
        Dependency(
          (i) => FavoriteApiClient(
            new Dio(),
          ),
        ),
      ];

  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => AppModule.to.getDependency<ApiClient>(),
        ),
        Bloc(
          (i) => AppModule.to.getDependency<FavoriteApiClient>(),
        ),
        Bloc(
          (i) => CharacterBloc(
            AppModule.to.getDependency<ApiClient>(),
          ),
        ),
        Bloc(
          (i) => FavoritesBloc(
            AppModule.to.getDependency<FavoriteApiClient>(),
          ),
        ),
      ];

  @override
  Widget get view => MyApp();

  static Inject get to => Inject<AppModule>.of();
}
