import 'dart:convert';

class UserModels {
  final String? idUtilisateur;
  final String? nomUtilisateur;
  final String? prenomUtilisateur;
  // final String? mdpUtilisateur;
  final String? telephoneUtilisateur;
  final String? emailUtilisateur;
  final String? gradeUtilisateur;
  final String? session;
  UserModels({
    this.idUtilisateur,
    this.nomUtilisateur,
    this.prenomUtilisateur,
    // this.mdpUtilisateur,
    this.telephoneUtilisateur,
    this.emailUtilisateur,
    this.gradeUtilisateur,
    this.session,
  });

  UserModels copyWith({
    String? idUtilisateur,
    String? nomUtilisateur,
    String? prenomUtilisateur,
    // String? mdpUtilisateur,
    String? telephoneUtilisateur,
    String? emailUtilisateur,
    String? gradeUtilisateur,
    String? session,
  }) {
    return UserModels(
      idUtilisateur: idUtilisateur ?? this.idUtilisateur,
      nomUtilisateur: nomUtilisateur ?? this.nomUtilisateur,
      prenomUtilisateur: prenomUtilisateur ?? this.prenomUtilisateur,
      // mdpUtilisateur: mdpUtilisateur ?? this.mdpUtilisateur,
      telephoneUtilisateur: telephoneUtilisateur ?? this.telephoneUtilisateur,
      emailUtilisateur: emailUtilisateur ?? this.emailUtilisateur,
      gradeUtilisateur: gradeUtilisateur ?? this.gradeUtilisateur,
      session: session ?? this.session,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idUtilisateur': idUtilisateur,
      'nomUtilisateur': nomUtilisateur,
      'prenomUtilisateur': prenomUtilisateur,
      // 'mdpUtilisateur': mdpUtilisateur,
      'telephoneUtilisateur': telephoneUtilisateur,
      'emailUtilisateur': emailUtilisateur,
      'gradeUtilisateur': gradeUtilisateur,
      'session': session,
    };
  }

  factory UserModels.fromMap(Map<String, dynamic> map) {
    return UserModels(
      idUtilisateur: map['idUtilisateur'],
      nomUtilisateur: map['nomUtilisateur'],
      prenomUtilisateur: map['prenomUtilisateur'],
      // mdpUtilisateur: map['mdpUtilisateur'],
      telephoneUtilisateur: map['telephoneUtilisateur'],
      emailUtilisateur: map['emailUtilisateur'],
      gradeUtilisateur: map['gradeUtilisateur'],
      session: map['session'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModels.fromJson(String source) =>
      UserModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModels(idUtilisateur: $idUtilisateur, nomUtilisateur: $nomUtilisateur, prenomUtilisateur: $prenomUtilisateur, telephoneUtilisateur: $telephoneUtilisateur, emailUtilisateur: $emailUtilisateur, gradeUtilisateur: $gradeUtilisateur, session: $session)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModels &&
        other.idUtilisateur == idUtilisateur &&
        other.nomUtilisateur == nomUtilisateur &&
        other.prenomUtilisateur == prenomUtilisateur &&
        // other.mdpUtilisateur == mdpUtilisateur &&
        other.telephoneUtilisateur == telephoneUtilisateur &&
        other.emailUtilisateur == emailUtilisateur &&
        other.gradeUtilisateur == gradeUtilisateur &&
        other.session == session;
  }

  @override
  int get hashCode {
    return idUtilisateur.hashCode ^
        nomUtilisateur.hashCode ^
        prenomUtilisateur.hashCode ^
        // mdpUtilisateur.hashCode ^
        telephoneUtilisateur.hashCode ^
        emailUtilisateur.hashCode ^
        gradeUtilisateur.hashCode ^
        session.hashCode;
  }
}
