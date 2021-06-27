import 'package:desafio_flutter/models/character_model.dart';
import 'package:desafio_flutter/ui/dimensoes_tela.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCharacterWidget extends StatefulWidget {
  const CardCharacterWidget({
    this.onTap,
    this.nome,
    this.altura,
    this.peso,
    this.genero,
  });

  final VoidCallback? onTap;
  final String? nome;
  final String? altura;
  final String? peso;
  final String? genero;

  static CardCharacterWidget buildCharacter({
    required CharactersModel charactersModel,
    VoidCallback? onTap,
  }) {
    return CardCharacterWidget(
      onTap: onTap,
      nome: charactersModel.nome,
      altura: charactersModel.altura,
      peso: charactersModel.peso,
      genero: charactersModel.genero,
    );
  }

  @override
  _CardCharacterWidgetState createState() => _CardCharacterWidgetState();
}

class _CardCharacterWidgetState extends State<CardCharacterWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: 18.h),
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right: 15.w),
              child: _titulo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titulo() {
    return Container(
      width: 225.w,
      child: Text(
        widget.nome!,
        style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'Open-Sans',
            fontWeight: FontWeight.w600),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.left,
      ),
    );
  }
}
