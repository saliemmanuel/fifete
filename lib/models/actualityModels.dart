import 'dart:convert';

class ActualityModels {
  final String? idActualite;
  final String? titreActualite;
  final String? descriptionActualite;
  final String? heureActualite;
  final String? imagesActualite;
  ActualityModels({
    this.idActualite,
    this.titreActualite,
    this.descriptionActualite,
    this.heureActualite,
    this.imagesActualite,
  });

  ActualityModels copyWith({
    String? idActualite,
    String? titreActualite,
    String? descriptionActualite,
    String? heureActualite,
    String? imagesActualite,
  }) {
    return ActualityModels(
      idActualite: idActualite ?? this.idActualite,
      titreActualite: titreActualite ?? this.titreActualite,
      descriptionActualite: descriptionActualite ?? this.descriptionActualite,
      heureActualite: heureActualite ?? this.heureActualite,
      imagesActualite: imagesActualite ?? this.imagesActualite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (idActualite != null) {
      result.addAll({'idActualite': idActualite});
    }
    if (titreActualite != null) {
      result.addAll({'titreActualite': titreActualite});
    }
    if (descriptionActualite != null) {
      result.addAll({'descriptionActualite': descriptionActualite});
    }
    if (heureActualite != null) {
      result.addAll({'heureActualite': heureActualite});
    }
    if (imagesActualite != null) {
      result.addAll({'imagesActualite': imagesActualite});
    }

    return result;
  }

  factory ActualityModels.fromMap(Map<String, dynamic> map) {
    return ActualityModels(
      idActualite: map['idActualite'],
      titreActualite: map['titreActualite'],
      descriptionActualite: map['descriptionActualite'],
      heureActualite: map['heureActualite'],
      imagesActualite: map['imagesActualite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActualityModels.fromJson(String source) =>
      ActualityModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActualityModels(idActualite: $idActualite, titreActualite: $titreActualite, descriptionActualite: $descriptionActualite, heureActualite: $heureActualite, imagesActualite: $imagesActualite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActualityModels &&
        other.idActualite == idActualite &&
        other.titreActualite == titreActualite &&
        other.descriptionActualite == descriptionActualite &&
        other.heureActualite == heureActualite &&
        other.imagesActualite == imagesActualite;
  }

  @override
  int get hashCode {
    return idActualite.hashCode ^
        titreActualite.hashCode ^
        descriptionActualite.hashCode ^
        heureActualite.hashCode ^
        imagesActualite.hashCode;
  }
}
