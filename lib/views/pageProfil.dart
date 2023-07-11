import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:flutter/material.dart';

class PageProfil extends StatefulWidget {
  final UserModels? user;
  const PageProfil({Key? key, required this.user}) : super(key: key);

  @override
  _PageProfilState createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  subtitle: Text(widget.user!.emailUtilisateur!),
                  title: Text("E-mail"),
                ),
                ListTile(
                  leading: Icon(Icons.security),
                  subtitle: Text("*********"),
                  title: Text("Mots de passe"),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  subtitle: Text(widget.user!.telephoneUtilisateur!),
                  title: Text("Téléphone"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Vos informations personnel",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  subtitle: Text(widget.user!.nomUtilisateur!),
                  title: Text("Nom"),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  subtitle: Text(widget.user!.prenomUtilisateur!),
                  title: Text("Prénom"),
                ),
                ListTile(
                  leading: Icon(Icons.domain),
                  subtitle: Text(widget.user!.gradeUtilisateur!),
                  title: Text("Grade"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
