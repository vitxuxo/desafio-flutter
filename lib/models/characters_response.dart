import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:desafio_flutter/models/character_model.dart';

class CharactersResponse {
  int? count;
  String? next;
  String? previous;
  List<CharactersModel>? results;

  CharactersResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharactersResponse &&
        other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results?.map((x) => x.toMap()).toList(),
    };
  }

  factory CharactersResponse.fromMap(Map<String, dynamic> map) {
    return CharactersResponse(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: List<CharactersModel>.from(
          map['results']?.map((x) => CharactersModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharactersResponse.fromJson(String source) =>
      CharactersResponse.fromMap(json.decode(source));
}
