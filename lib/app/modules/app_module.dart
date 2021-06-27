import 'package:desafio_flutter/app/api/api_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ApiClient(
            i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [];
}
