import 'package:fifete/api/api.dart';
import 'package:fifete/db/db.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:fifete/views/wiews.dart';
import 'package:flutter/material.dart';

import 'widgets/widget.dart';

class PageMenu extends StatefulWidget {
  final UserModels? user;

  const PageMenu({Key? key, required this.user}) : super(key: key);

  @override
  _PageMenuState createState() => _PageMenuState();
}

class _PageMenuState extends State<PageMenu> {
  var service = ServiceApi();
  var canalData;
  CanalModels? canal;

  @override
  void initState() {
    menGetCanalData();
    super.initState();
  }

  menGetCanalData() async {
    try {
      // canalData = await service.getCanalData(
      //   widget.user!.idUtilisateur,
      //   widget.user!.gradeUtilisateur,
      // );

      canalData = await getCanalData();
      canal = CanalModels(
        idCanal: canalData[0]['idCanal'].toString(),
        nomCanal: canalData[0]['nomCanal'],
        imageCanal: canalData[0]['imageCanal'],
        lienCanal: canalData[0]['lienCanal'],
        typeCanal: canalData[0]['typeCanal'],
        idUtilisateur: canalData[0]['idUtilisateur'],
      );
      print(canal);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomMenuListTile(
          title: 'Vos commande',
          icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
          onTap: () => pushNewPage(PageListeCommande(), context),
        ),
        CustomMenuListTile(
          title: 'A propos',
          icon: Icon(Icons.info_outline, color: Colors.white),
          onTap: () => pushNewPage(PageAbout(), context),
        ),
        CustomMenuListTile(
          title: 'Signaler un problème',
          icon: Icon(Icons.mail_outline_rounded, color: Colors.white),
          onTap: () => pushNewPage(PageNewLetter(), context),
        ),
      ],
    );
  }
}
