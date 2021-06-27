import 'dart:convert';

import 'package:flutter/foundation.dart';

class CharactersModel {
  int? id;
  String? nome;
  String? altura;
  String? peso;
  String? corCabelo;
  String? corPele;
  String? corOlhos;
  String? anoNascimento;
  String? genero;
  String? planetaNatal;
  List<String>? especies;

  CharactersModel({
    this.id,
    this.nome,
    this.altura,
    this.peso,
    this.corCabelo,
    this.corPele,
    this.corOlhos,
    this.anoNascimento,
    this.genero,
    this.planetaNatal,
    required this.especies,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'altura': altura,
      'peso': peso,
      'corCabelo': corCabelo,
      'corPele': corPele,
      'corOlhos': corOlhos,
      'anoNascimento': anoNascimento,
      'genero': genero,
      'planetaNatal': planetaNatal,
      'especies': especies,
    };
  }

  factory CharactersModel.fromMap(Map<String, dynamic> map) {
    return CharactersModel(
      id: map['id'],
      nome: map['nome'],
      altura: map['altura'],
      peso: map['peso'],
      corCabelo: map['corCabelo'],
      corPele: map['corPele'],
      corOlhos: map['corOlhos'],
      anoNascimento: map['anoNascimento'],
      genero: map['genero'],
      planetaNatal: map['planetaNatal'],
      especies: List<String>.from(map['especies'] ?? [""]),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharactersModel.fromJson(String source) =>
      CharactersModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharactersModel &&
        other.id == id &&
        other.nome == nome &&
        other.altura == altura &&
        other.peso == peso &&
        other.corCabelo == corCabelo &&
        other.corPele == corPele &&
        other.corOlhos == corOlhos &&
        other.anoNascimento == anoNascimento &&
        other.genero == genero &&
        other.planetaNatal == planetaNatal &&
        listEquals(other.especies, especies);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        altura.hashCode ^
        peso.hashCode ^
        corCabelo.hashCode ^
        corPele.hashCode ^
        corOlhos.hashCode ^
        anoNascimento.hashCode ^
        genero.hashCode ^
        planetaNatal.hashCode ^
        especies.hashCode;
  }

  @override
  String toString() {
    return 'CharactersModel(id: $id, nome: $nome, altura: $altura, peso: $peso, corCabelo: $corCabelo, corPele: $corPele, corOlhos: $corOlhos, anoNascimento: $anoNascimento, genero: $genero, planetaNatal: $planetaNatal, especies: $especies)';
  }
}
