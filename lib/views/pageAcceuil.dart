import 'package:flutter/material.dart';

import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';

import 'wiews.dart';

class PageAcceuil extends StatefulWidget {
  final int? initialIndex;
  final UserModels? user;
  final String? sharedText;

  const PageAcceuil({
    Key? key,
    required this.initialIndex,
    required this.user,
    required this.sharedText,
  }) : super(key: key);
  @override
  _PageAcceuilState createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  @override
  Widget build(BuildContext context) {
    return (widget.sharedText == null)
        ? DefaultTabController(
            initialIndex: widget.initialIndex!,
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Coton Sport de Garoua',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(ImageAsset.logoSansBordure),
                          // backgroundImage: NetWorkImage(ImageAsset.logoSansBordure),
                          maxRadius: 25.0),
                    ),
                    SizedBox(width: 15.0),
                  ],
                ),
                bottomNavigationBar: TabBar(
                  labelPadding: const EdgeInsets.all(15.0),
                  labelColor: ColorsApp.primaryColor,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: ColorsApp.primaryColor,
                  tabs: [
                    Icon(Icons.backup_table, size: 30.0),
                    Icon(Icons.notifications_none, size: 30.0),
                    Icon(Icons.add_business_rounded, size: 30.0),
                    Icon(Icons.menu, size: 30.0),
                  ],
                ),
                body: TabBarView(
                  children: [
                    PageActualite(user: widget.user),
                    PageNotification(user: widget.user),
                    PageArticle(user: widget.user),
                    PageMenu(user: widget.user),
                  ],
                )),
          )
        : PageReceiveData(sharedText: widget.sharedText);
  }

  void _launchURL(var _url) async {
    if (!await launch(
      _url,
    )) throw 'Could not launch $_url';
  }
}
