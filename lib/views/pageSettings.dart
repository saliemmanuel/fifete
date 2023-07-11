import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:flutter/material.dart';

import 'widgets/widget.dart';

class PageSettings extends StatefulWidget {
  final UserModels? user;
  const PageSettings({Key? key, required this.user}) : super(key: key);

  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Paramètres',
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            CustomMenuListTile(
              icon: Icon(Icons.lock, color: Colors.white),
              title: 'Confidentialité',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content:
                        Text("Fonctionnalité en cours de développement! ")));
              },
            ),
            CustomMenuListTile(
              icon: Icon(Icons.security_outlined, color: Colors.white),
              title: 'Sécurité',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content:
                        Text("Fonctionnalité en cours de développement! ")));
              },
            ),
            CustomMenuListTile(
              icon: Icon(Icons.info, color: Colors.white),
              title: 'Demander infos compte',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content:
                        Text("Fonctionnalité en cours de développement! ")));
              },
            ),
            CustomMenuListTile(
              icon: Icon(Icons.settings, color: Colors.white),
              title: 'Paramètre du compte',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content:
                        Text("Fonctionnalité en cours de développement! ")));
              },
            ),
            CustomMenuListTile(
              icon: Icon(Icons.delete, color: Colors.white),
              title: 'Supprimer mon compte',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content:
                        Text("Fonctionnalité en cours de développement! ")));
              },
            ),
          ],
        ),
      ),
    );
  }
}
