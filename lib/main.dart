import 'package:flutter/material.dart';
import 'package:fifete/db/db.dart';
import 'cofing/theme.dart';
import 'utils/library/library.dart';
import 'views/wiews.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase(dbName: 'fifete');
  var user = await getUserData();
  runApp(MaterialApp(
    title: 'Coton Sport de Garoua',
    home: PageAcceuil(
      user: null,
      initialIndex: 0,
      sharedText: null,
    ),
    theme: ThemeApp.light,
    debugShowCheckedModeBanner: false,
  ));
}
