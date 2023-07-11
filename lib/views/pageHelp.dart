import 'package:fifete/cofing/config.dart';
import 'package:flutter/material.dart';

class PageHelp extends StatelessWidget {
  const PageHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Aide",
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
    );
  }
}
