import 'dart:convert';

class CanalModels {
  final String? idCanal;
  final String? nomCanal;
  final String? lienCanal;
  final String? imageCanal;
  final String? typeCanal;
  final String? idUtilisateur;
  CanalModels({
    this.idCanal,
    this.nomCanal,
    this.lienCanal,
    this.imageCanal,
    this.typeCanal,
    this.idUtilisateur,
  });

  CanalModels copyWith({
    String? idCanal,
    String? nomCanal,
    String? lienCanal,
    String? imageCanal,
    String? typeCanal,
    String? idUtilisateur,
  }) {
    return CanalModels(
      idCanal: idCanal ?? this.idCanal,
      nomCanal: nomCanal ?? this.nomCanal,
      lienCanal: lienCanal ?? this.lienCanal,
      imageCanal: imageCanal ?? this.imageCanal,
      typeCanal: typeCanal ?? this.typeCanal,
      idUtilisateur: idUtilisateur ?? this.idUtilisateur,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCanal': idCanal,
      'nomCanal': nomCanal,
      'lienCanal': lienCanal,
      'imageCanal': imageCanal,
      'typeCanal': typeCanal,
      'idUtilisateur': idUtilisateur,
    };
  }

  factory CanalModels.fromMap(Map<String, dynamic> map) {
    return CanalModels(
      idCanal: map['idCanal'],
      nomCanal: map['nomCanal'],
      lienCanal: map['lienCanal'],
      imageCanal: map['imageCanal'],
      typeCanal: map['typeCanal'],
      idUtilisateur: map['idUtilisateur'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CanalModels.fromJson(String source) =>
      CanalModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CanalModels(idCanal: $idCanal, nomCanal: $nomCanal, lienCanal: $lienCanal, imageCanal: $imageCanal, typeCanal: $typeCanal, idUtilisateur: $idUtilisateur)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CanalModels &&
        other.idCanal == idCanal &&
        other.nomCanal == nomCanal &&
        other.lienCanal == lienCanal &&
        other.imageCanal == imageCanal &&
        other.typeCanal == typeCanal &&
        other.idUtilisateur == idUtilisateur;
  }

  @override
  int get hashCode {
    return idCanal.hashCode ^
        nomCanal.hashCode ^
        lienCanal.hashCode ^
        imageCanal.hashCode ^
        typeCanal.hashCode ^
        idUtilisateur.hashCode;
  }
}
