import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';

import 'widget.dart';

class CustomDetailActualite extends StatefulWidget {
  final String? rubriqueTitle;
  final ActualityModels? actuality;
  final UserModels? user;
  final bool? enableOveflow;

  final bool? enableExpandText;
  final int? initialIndex;

  const CustomDetailActualite(
      {Key? key,
      required this.rubriqueTitle,
      this.enableOveflow,
      required this.enableExpandText,
      required this.actuality,
      required this.user,
      required this.initialIndex})
      : super(key: key);
  @override
  _DetailActualiteState createState() => _DetailActualiteState();
}

class _DetailActualiteState extends State<CustomDetailActualite> {
  var _like, _comment, _share;
  var itLiked = false;
  var itComment = false;
  var itShared = false;
  var commentController = TextEditingController();
  var host = Host();
  var service = ServiceApi();
  var listImage;
  var listCommentaire;

  @override
  void initState() {
    // getListImage();
    // getCommentaire();
    // detectIfUserLikeCommentAndShare();
    // singleActuality();
    super.initState();
  }

  getListImage() async {
    listImage = await service.getListImageActuality(
        idActualite: widget.actuality!.idActualite);
    setState(() {});
  }

  getCommentaire() async {
    listCommentaire = await service.getAllcommentActualityById(
        idActualite: widget.actuality!.idActualite, context: context);
    setState(() {});
    // print(listCommentaire);
  }

  var res;
  detectIfUserLikeCommentAndShare() async {
    res = await service.detectIfUserLikeCommentAndShare(
        idActualite: widget.actuality!.idActualite,
        idUtilisateur: widget.user!.idUtilisateur);
    if (res != null) {
      if (res['resultShare'] == true) {
        itShared = true;
      }
      if (res['resultLike'] == true) {
        itLiked = true;
      }
    }
    setState(() {});
    print(res);
  }

  var curentActu;
  singleActuality() async {
    curentActu = await service.getSingleActuality(
        idActualite: widget.actuality!.idActualite);
    if (curentActu != null) {
      _like = int.parse(curentActu["like_count"]);
      _comment = int.parse(curentActu["commentaire_count"]);
      _share = int.parse(curentActu["partage_count"]);
    }
    setState(() {});
    print(curentActu);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(widget.rubriqueTitle!,
            style: TextStyle(color: ColorsApp.primaryTextColorLight)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                const SizedBox(height: 15.0),
                CustomNewsCard(
                  actuality: widget.actuality,
                  enableOveflow: widget.enableOveflow,
                  enableExpandText: widget.enableExpandText,
                  photoViewIsEnable: true,
                  user: widget.user,
                  enableDescription: false,
                  // photoView: () => pushNewPage(
                  //     Scaffold(
                  //         appBar: AppBar(
                  //           title: Text(
                  //             widget.actuality!.titreActualite!,
                  //             style: TextStyle(
                  //               color: ColorsApp.primaryTextColorLight,
                  //             ),
                  //           ),
                  //         ),
                  //         body: listImage == null
                  //             ? Column(
                  //                 children: List.generate(
                  //                     2,
                  //                     (index) => Shimmer(
                  //                         period: Duration(seconds: 7),
                  //                         gradient: LinearGradient(colors: [
                  //                           Colors.grey,
                  //                           Colors.white
                  //                         ]),
                  //                         child: Container(
                  //                             margin:
                  //                                 const EdgeInsets.all(5.0),
                  //                             color: Colors.red,
                  //                             height: 250.0))),
                  //               )
                  //             : Container(
                  //                 color: Colors.grey.shade200,
                  //                 child: ListView.builder(
                  //                     itemCount: listImage == null
                  //                         ? 0
                  //                         : listImage.length,
                  //                     itemBuilder: (_, i) {
                  //                       return Padding(
                  //                         padding: const EdgeInsets.all(5.0),
                  //                         child: InkWell(
                  //                             child: Image.network(
                  //                               host.url() +
                  //                                   listImage[i]
                  //                                       ['source_good_image'],
                  //                               fit: BoxFit.cover,
                  //                             ),
                  //                             onTap: () {
                  //                               pushNewPage(
                  //                                   PhotoView(
                  //                                     imageProvider:
                  //                                         NetworkImage(
                  //                                       "${host.url() + listImage[i]['source_good_image']}",
                  //                                     ),
                  //                                     loadingBuilder:
                  //                                         (context, event) {
                  //                                       if (event == null) {
                  //                                         return const Center(
                  //                                           child: Text(
                  //                                               "Chargement ..."),
                  //                                         );
                  //                                       }
                  //                                       final value = event
                  //                                               .cumulativeBytesLoaded /
                  //                                           (event.expectedTotalBytes ??
                  //                                               event
                  //                                                   .cumulativeBytesLoaded);
                  //                                       final percentage =
                  //                                           (100 * value)
                  //                                               .floor();
                  //                                       return Center(
                  //                                         child: Text(
                  //                                             "$percentage%"),
                  //                                       );
                  //                                     },
                  //                                   ),
                  //                                   context);
                  //                             }),
                  //                       );
                  //                     }),
                  //               )),
                  //     context)
                ),
                curentActu == null
                    ? Shimmer(
                        period: Duration(seconds: 7),
                        gradient:
                            LinearGradient(colors: [Colors.grey, Colors.white]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              CustomButton(
                                  iconButton: null, numberReaction: ""),
                              CustomButton(
                                  iconButton: null, numberReaction: ""),
                              CustomButton(
                                  iconButton: null, numberReaction: ""),
                            ],
                          ),
                        ))
                    : Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(
                                  iconButton: FeatherIcons.thumbsUp,
                                  numberReaction: '$_like',
                                  isClick: itLiked,
                                  onPressed: () async {
                                    if (!itLiked) {
                                      _like += 1;
                                      itLiked = await service.likeActuality(
                                        idActualite:
                                            widget.actuality!.idActualite,
                                        idUtilisateur:
                                            widget.user!.idUtilisateur,
                                      );
                                    } else if (itLiked) {
                                      itLiked = await service.getDeleteLike(
                                        idActualite:
                                            widget.actuality!.idActualite,
                                        idUtilisateur:
                                            widget.user!.idUtilisateur,
                                      );
                                      _like -= 1;
                                    }
                                    setState(() {});
                                  },
                                ),
                                CustomButton(
                                  iconButton: FeatherIcons.messageCircle,
                                  numberReaction:
                                      _comment == null ? "" : '$_comment',
                                  isClick: itComment,
                                ),
                                CustomButton(
                                  iconButton: Icons.share,
                                  numberReaction: '$_share',
                                  isClick: itShared,
                                  onPressed: () async {
                                    if (!itShared) {
                                      _share += 1;
                                      itShared = await service.shareActuality(
                                        idActualite:
                                            widget.actuality!.idActualite,
                                        idUtilisateur:
                                            widget.user!.idUtilisateur,
                                      );
                                      Share.share(widget.actuality!
                                              .descriptionActualite! +
                                          '...\n\n' +
                                          "🔴🔴🔴Télécharge l'application Fifete pour toute les actualité en exclusivité."
                                              .toUpperCase() +
                                          '👇👇👇\nhttp://www.fifite.com/apk/');
                                    }
                                    setState(() {});
                                  },
                                ),
                              ],
                            )),
                      ),
                Divider(),
                listCommentaire == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FeatherIcons.inbox,
                              size: 45.0, color: Colors.black87),
                          Text("Aucun commentaire"),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listCommentaire == null
                              ? 0
                              : listCommentaire.length,
                          itemBuilder: (_, i) {
                            return InkWell(
                              child: CustomCommentCard(
                                title: listCommentaire[i]['nom_uitilsateur'],
                                hour: service.formatDate(listCommentaire[i]
                                        ['heure_commentaire']
                                    .toString()),
                                contenusCommentaire: listCommentaire[i]
                                    ['contenus_commentaire'],
                              ),
                            );
                          },
                        ),
                      ),
                SizedBox(height: 100.0),
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
                            controller: commentController,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            borderRadius: 25.0,
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
                              if (commentController.text.isNotEmpty) {
                                await service.commentActuality(
                                    idUtilisateur: widget.user!.idUtilisateur,
                                    idActualite: widget.actuality!.idActualite,
                                    nomUtilisateur:
                                        "${widget.user!.nomUtilisateur} ${widget.user!.prenomUtilisateur}",
                                    contenusCommentaire: commentController.text,
                                    idCommentaire_1: null,
                                    context: context);
                                commentController.clear();
                                getCommentaire();
                              }
                              getListImage();
                              getCommentaire();
                              singleActuality();
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
      ),
    );
  }
}
