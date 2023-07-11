import 'package:cached_network_image/cached_network_image.dart';
import 'package:fifete/api/api.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:flutter/material.dart';

import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:flutter/services.dart';

import 'widgets/widget.dart';
import 'wiews.dart';

class PageGestionCanal extends StatefulWidget {
  final UserModels? user;
  final CanalModels? canal;
  const PageGestionCanal({
    Key? key,
    this.user,
    required this.canal,
  }) : super(key: key);

  @override
  _PageGestionCanalState createState() => _PageGestionCanalState();
}

class _PageGestionCanalState extends State<PageGestionCanal> {
  var service = ServiceApi();
  var host = Host();

  @override
  void initState() {
    singleActualityAdmin();
    super.initState();
  }

  var listActu;
  singleActualityAdmin() async {
    listActu =
        await service.getActualityBySingleAdmin(idCanal: widget.canal!.idCanal);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              pushNewPageRemoveUntil(
                  PageAcceuil(
                      user: widget.user, initialIndex: 3, sharedText: null),
                  context);
            },
          ),
          title: Text(
            widget.canal!.nomCanal ?? "",
            style: TextStyle(color: ColorsApp.primaryTextColorLight),
          ),
        ),
        body: RefreshIndicator(
          child: ListView(
            children: [
              if (listActu == null)
                for (var o = 0; o < 3; o++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer(
                          period: Duration(seconds: 7),
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 4.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ],
                            ),
                          ))
                    ],
                  )
              else
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (widget.user!.gradeUtilisateur! == 'super_admin' ||
                      widget.user!.gradeUtilisateur! == 'admin') ...[
                    SizedBox(height: 10.0),
                    CustomMenuListTile(
                      title: 'Ajouter une actualité',
                      icon: Icon(Icons.backup_table, color: Colors.white),
                      onTap: () => pushNewPage(
                          PageAddActualite(
                              user: widget.user, canal: widget.canal),
                          context),
                    ),
                    ListTile(
                      leading: Text(
                        'Vos actualités',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold),
                      ),
                      // trailing: IconButton(
                      //     icon: Icon(Icons.search), onPressed: () {}),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: listActu == null ? 0 : listActu.length,
                      itemBuilder: (_, i) {
                        return Column(
                          children: [
                            Divider(),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: ListTile(
                                  title: HashTagText(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    text: listActu[i]['description_actualite'],
                                    decoratedStyle: TextStyle(
                                        fontSize: 19.0, color: Colors.blue),
                                    basicStyle: TextStyle(
                                        fontSize: 19.0, color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    service.formatDate(
                                        listActu[i]['heure_actualite']),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.grey.shade100,
                                          elevation: 0.0,
                                          builder: (BuildContext context) {
                                            return Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  CustomListTile(
                                                    icon: Icons.share,
                                                    text: "Partager",
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      Share.share(listActu[i][
                                                                  'description_actualite']
                                                              .substring(
                                                                  0,
                                                                  (listActu[i]['description_actualite']
                                                                              .length /
                                                                          2)
                                                                      .truncate()
                                                                      .toInt()) +
                                                          '...\n\n' +
                                                          "🔴🔴🔴Télécharge l'application Fifete pour toute les actualité en exclusivité."
                                                              .toUpperCase() +
                                                          '👇👇👇\nhttp://www.fifite.com/apk/');
                                                    },
                                                  ),
                                                  CustomListTile(
                                                    icon: Icons.copy,
                                                    text: "Copier le lien",
                                                    onTap: () {
                                                      Clipboard.setData(
                                                          ClipboardData(
                                                              text: listActu[i][
                                                                  'source_actualite']));
                                                      Alert(
                                                              message:
                                                                  "Le lien a bien été copié.")
                                                          .show();
                                                    },
                                                  ),
                                                  CustomListTile(
                                                    icon: Icons.edit,
                                                    text: "Editer",
                                                    onTap: () => pushNewPage(
                                                        PageUpdateActualite(
                                                          user: widget.user,
                                                          canal: widget.canal!,
                                                          newDescription: listActu[
                                                                  i][
                                                              'description_actualite'],
                                                          idActualite: listActu[
                                                                  i]
                                                              ['id_actualite'],
                                                        ),
                                                        context),
                                                  ),
                                                  // CustomListTile(
                                                  //   icon: Icons.delete,
                                                  //   text: "Supprimer",
                                                  //   onTap: () {
                                                  //     service.deleteActualite(
                                                  //         idCanal: listActu[i]
                                                  //             ['id_actualite'],
                                                  //         idActualite:
                                                  //             listActu[i]
                                                  //                 ['id_canal'],
                                                  //         context: context);
                                                  //     singleActualityAdmin();
                                                  //   },
                                                  // ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ),
                              onTap: () => pushNewPage(
                                  CustomDetailActualite(
                                    initialIndex: 2,
                                    rubriqueTitle: 'Actualités',
                                    actuality: ActualityModels(
                                        idActualite: listActu[i]
                                            ['id_actualite'],
                                        
                                        titreActualite: listActu[i]
                                            ['titre_actualite'],
                                        heureActualite: listActu[i]
                                            ['heure_actualite'],
                                        imagesActualite: listActu[i]
                                            ['images_actualite'],
                                        descriptionActualite: listActu[i]
                                            ['description_actualite'],
                                    ),
                                    
                                  
                                    
                                    enableOveflow: true,
                                    enableExpandText: true,
                                    user: widget.user,
                                  ),
                                  context),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ])
            ],
          ),
          onRefresh: () => singleActualityAdmin(),
        ));
  }
}
