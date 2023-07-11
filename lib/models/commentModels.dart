import 'dart:convert';

class CommentModels {
  final String? idCommentaire;
  final String? nomUtilisateur;
  final String? heurCommentaire;
  final String? contenusCommentaire;
  final String? idCommentaire_1;
  final String? idUtilisateur;
  final String? idActualite;
  CommentModels({
    this.idCommentaire,
    this.nomUtilisateur,
    this.heurCommentaire,
    this.contenusCommentaire,
    this.idCommentaire_1,
    this.idUtilisateur,
    this.idActualite,
  });

  CommentModels copyWith({
    String? idCommentaire,
    String? nomUtilisateur,
    String? heurCommentaire,
    String? contenusCommentaire,
    String? idCommentaire_1,
    String? idUtilisateur,
    String? idActualite,
  }) {
    return CommentModels(
      idCommentaire: idCommentaire ?? this.idCommentaire,
      nomUtilisateur: nomUtilisateur ?? this.nomUtilisateur,
      heurCommentaire: heurCommentaire ?? this.heurCommentaire,
      contenusCommentaire: contenusCommentaire ?? this.contenusCommentaire,
      idCommentaire_1: idCommentaire_1 ?? this.idCommentaire_1,
      idUtilisateur: idUtilisateur ?? this.idUtilisateur,
      idActualite: idActualite ?? this.idActualite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCommentaire': idCommentaire,
      'nomUtilisateur': nomUtilisateur,
      'heurCommentaire': heurCommentaire,
      'contenusCommentaire': contenusCommentaire,
      'idCommentaire_1': idCommentaire_1,
      'idUtilisateur': idUtilisateur,
      'idActualite': idActualite,
    };
  }

  factory CommentModels.fromMap(Map<String, dynamic> map) {
    return CommentModels(
      idCommentaire: map['idCommentaire'],
      nomUtilisateur: map['nomUtilisateur'],
      heurCommentaire: map['heurCommentaire'],
      contenusCommentaire: map['contenusCommentaire'],
      idCommentaire_1: map['idCommentaire_1'],
      idUtilisateur: map['idUtilisateur'],
      idActualite: map['idActualite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModels.fromJson(String source) =>
      CommentModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentModels(idCommentaire: $idCommentaire, nomUtilisateur: $nomUtilisateur, heurCommentaire: $heurCommentaire, contenusCommentaire: $contenusCommentaire, idCommentaire_1: $idCommentaire_1, idUtilisateur: $idUtilisateur, idActualite: $idActualite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentModels &&
        other.idCommentaire == idCommentaire &&
        other.nomUtilisateur == nomUtilisateur &&
        other.heurCommentaire == heurCommentaire &&
        other.contenusCommentaire == contenusCommentaire &&
        other.idCommentaire_1 == idCommentaire_1 &&
        other.idUtilisateur == idUtilisateur &&
        other.idActualite == idActualite;
  }

  @override
  int get hashCode {
    return idCommentaire.hashCode ^
        nomUtilisateur.hashCode ^
        heurCommentaire.hashCode ^
        contenusCommentaire.hashCode ^
        idCommentaire_1.hashCode ^
        idUtilisateur.hashCode ^
        idActualite.hashCode;
  }
}
