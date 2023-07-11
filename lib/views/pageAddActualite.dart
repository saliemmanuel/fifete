import 'dart:io';

import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:fifete/views/widgets/widget.dart';
import 'package:fifete/views/wiews.dart';
import 'dart:math' as Math;
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;

class PageAddActualite extends StatefulWidget {
  final UserModels? user;
  final CanalModels? canal;
  const PageAddActualite({Key? key, required this.user, required this.canal})
      : super(key: key);

  @override
  _PageAddActualiteState createState() => _PageAddActualiteState();
}

class _PageAddActualiteState extends State<PageAddActualite> {
  var description = TextEditingController();
  var titre = TextEditingController();

  List listImage = [];
  ImageCard fileImage = ImageCard(fileImage: null);
  File? fileImage5;

  var service = ServiceApi();
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => pushNewPage(
              PageGestionCanal(user: widget.user!, canal: widget.canal),
              context),
        ),
        title: Text(
          'Publier actualités',
          style: TextStyle(
              color: ColorsApp.primaryTextColorLight,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            child: Text(
              "PUBLIER",
              style: TextStyle(
                  color: ColorsApp.primaryTextColorLight,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: publierAcutualite,
          ),
          SizedBox(width: 10.0)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(9.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Ajoutez des photos",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0)),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        for (var i = 0; i < listImage.length; i++)
                          InkWell(
                            child: listImage[i],
                            onLongPress: () {
                              customDialogue(context, "Supprimer",
                                  "Confirmer la suppression de l'image ?",
                                  text: "Confirmer", onPressed: () {
                                setState(() => listImage.removeAt(i));
                                Navigator.pop(context);
                              });
                            },
                          ),
                        InkWell(
                            child: Container(
                                margin: EdgeInsets.all(5.0),
                                width: 90.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(9.0)),
                                child: Icon(Icons.add_a_photo_outlined,
                                    color: Colors.white, size: 25.0)),
                            onTap: () async {
                              // var image = await FilePicker.platform.pickFiles(
                              //     allowMultiple: false,
                              //     allowCompression: true,
                              //     type: FileType.image,
                              //     dialogTitle: 'Images Fifete',
                              //     onFileLoading: (value) {
                              //       print(value);
                              //     });
                              setState(() {
                                fileImage5 = null;
                              });

                              setState(() {
                                listImage.add(fileImage = new ImageCard(
                                  fileImage: fileImage5,
                                ));
                              });
                              print("fileImage5 " + fileImage5.toString());
                            }),
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(9.0)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: description,
                      minLines: 1,
                      maxLines: null,
                      scrollPhysics: ScrollPhysics(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: ColorsApp.primaryTextColorLight),
                          border: InputBorder.none,
                          hintText: 'Descriptions'),
                    ),
                  )),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: ColorsApp.primaryColor,
                      child: Text(
                        'PUBLIER',
                        style:
                            TextStyle(color: ColorsApp.primaryTextColorLight),
                      ),
                      onPressed: publierAcutualite,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  publierAcutualite() {
    if (fileImage.fileImage == null) {
      errorDialogueCard(
          "Erreur!", "Selection au moins une image svp!", context);
    } else if (description.text.isEmpty) {
      errorDialogueCard("Erreur", "Saisissez une description svp", context);
    } else {
      List finalImageList = [];
      for (var i = 0; i < listImage.length; i++) {
        ImageCard curentImageCard = listImage[i];
        finalImageList.add(curentImageCard.fileImage!);
      }
      service.publishActuality(
          idUtilisateur: widget.user!.idUtilisateur,
          gradeUtilisateur: widget.user!.gradeUtilisateur,
          titreActualite: titre.text,
          typeActualite: 'actualite',
          descriptionActualite: description.text,
          listImage: finalImageList,
          callBack: clearD(),
          context: context);
    }
  }

  clearD() {
    listImage.clear();
    description.clear();
    setState(() {});
  }
}
