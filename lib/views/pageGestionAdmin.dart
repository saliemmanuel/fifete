import 'package:fifete/cofing/config.dart';
import 'package:flutter/material.dart';

class PageGererAdmin extends StatelessWidget {
  const PageGererAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Gerer les Admins",
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
    );
  }
}
