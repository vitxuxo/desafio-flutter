import 'package:desafio_flutter/app/modules/app_module.dart';
import 'package:desafio_flutter/models/character_model.dart';
import 'package:desafio_flutter/shared/blocs/character_bloc.dart';
import 'package:desafio_flutter/widget/card_character_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final bloc = AppModule.to.getBloc<CharacterBloc>();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<CharactersModel?>(
          stream: widget.bloc.characters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  var character = snapshot.data!;

                  return CardCharacterWidget.buildCharacter(
                    charactersModel: character,
                    onTap: () {},
                  );
                },
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
