import 'dart:convert';

class SpeciesModel {
  String? nome;
  String? classificacao;
  String? desiginacao;
  double? altura;
  String? corPele;
  String? corCabelo;
  String? corOlhos;
  String? tempoDeVida;
  String? lingua;
  String? planetaNatal;

  SpeciesModel({
    this.nome,
    this.classificacao,
    this.desiginacao,
    this.altura,
    this.corPele,
    this.corCabelo,
    this.corOlhos,
    this.tempoDeVida,
    this.lingua,
    this.planetaNatal,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'classificacao': classificacao,
      'desiginacao': desiginacao,
      'altura': altura,
      'corPele': corPele,
      'corCabelo': corCabelo,
      'corOlhos': corOlhos,
      'tempoDeVida': tempoDeVida,
      'lingua': lingua,
      'planetaNatal': planetaNatal,
    };
  }

  factory SpeciesModel.fromMap(Map<String, dynamic> map) {
    return SpeciesModel(
      nome: map['nome'],
      classificacao: map['classificacao'],
      desiginacao: map['desiginacao'],
      altura: map['altura'],
      corPele: map['corPele'],
      corCabelo: map['corCabelo'],
      corOlhos: map['corOlhos'],
      tempoDeVida: map['tempoDeVida'],
      lingua: map['lingua'],
      planetaNatal: map['planetaNatal'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpeciesModel.fromJson(String source) =>
      SpeciesModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpeciesModel &&
        other.nome == nome &&
        other.classificacao == classificacao &&
        other.desiginacao == desiginacao &&
        other.altura == altura &&
        other.corPele == corPele &&
        other.corCabelo == corCabelo &&
        other.corOlhos == corOlhos &&
        other.tempoDeVida == tempoDeVida &&
        other.lingua == lingua &&
        other.planetaNatal == planetaNatal;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        classificacao.hashCode ^
        desiginacao.hashCode ^
        altura.hashCode ^
        corPele.hashCode ^
        corCabelo.hashCode ^
        corOlhos.hashCode ^
        tempoDeVida.hashCode ^
        lingua.hashCode ^
        planetaNatal.hashCode;
  }
}
