import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class CustomRecoment extends StatefulWidget {
  final curentCommentaire;
  final UserModels? user;
  final ActualityModels? actuality;
  const CustomRecoment(
      {Key? key,
      required this.curentCommentaire,
      required this.user,
      required this.actuality})
      : super(key: key);

  @override
  _CustomRecomentState createState() => _CustomRecomentState();
}

class _CustomRecomentState extends State<CustomRecoment> {
  @override
  void initState() {
    super.initState();
    print(widget.curentCommentaire['id_commentaire']);
  }

  var commentController = TextEditingController();
  var service = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.curentCommentaire['nom_uitilsateur'],
              style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ListView(
                children: [
                  CustomCommentCard(
                    title: widget.curentCommentaire['nom_uitilsateur'],
                    hour: service.formatDate(widget
                        .curentCommentaire['heure_commentaire']
                        .toString()),
                    contenusCommentaire:
                        widget.curentCommentaire['contenus_commentaire'],
                  ),
                  Divider(thickness: 5.0, height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (_, i) {
                      return CustomCommentCard(
                        title: widget.curentCommentaire['nom_uitilsateur'],
                        hour: service.formatDate(widget
                            .curentCommentaire['heure_commentaire']
                            .toString()),
                        contenusCommentaire:
                            widget.curentCommentaire['contenus_commentaire'],
                      );
                    },
                  ),
                  SizedBox(height: 150.0),
                ],
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustumCommentaireTextField(
                              child: 'Commentaire',
                              obscureText: false,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          IconButton(
                              icon: Icon(
                                Icons.send,
                                color: ColorsApp.primaryColor,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                // Recommenter un commentaire
                                if (commentController.text.isNotEmpty) {
                                  await service.commentActuality(
                                      idUtilisateur: widget.user!.idUtilisateur,
                                      idActualite:
                                          widget.actuality!.idActualite,
                                      nomUtilisateur:
                                          "${widget.user!.nomUtilisateur} ${widget.user!.prenomUtilisateur}",
                                      contenusCommentaire:
                                          commentController.text,
                                      idCommentaire_1: null,
                                      context: context);
                                  commentController.clear();
                                  // getCommentaire();
                                }
                              }),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
