import 'package:fifete/models/models.dart';

class SuperAdminModels extends UserModels {
  final String idSuperAdmin;

  SuperAdminModels({
    required this.idSuperAdmin,
    required String? idUtilisateur,
    required String? nomUtilisateur,
    required String? prenomUtilisateur,
    required String? emailUtilisateur,
    required String? telephoneUtilisateur,
    required String? gradeUtilisateur,
    required String? mdpUtilisateur,
    required String? session,
  }) : super(
            idUtilisateur: idUtilisateur,
            nomUtilisateur: nomUtilisateur,
            prenomUtilisateur: prenomUtilisateur,
            emailUtilisateur: emailUtilisateur,
            telephoneUtilisateur: telephoneUtilisateur,
            gradeUtilisateur: gradeUtilisateur,
            // mdpUtilisateur: mdpUtilisateur,
            session: session);
}
