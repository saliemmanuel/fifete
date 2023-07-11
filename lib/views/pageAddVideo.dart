import 'dart:io';

import 'package:fifete/cofing/config.dart';
import 'package:fifete/utils/library/library.dart';

import 'widgets/widget.dart';

class PageAddVideo extends StatefulWidget {
  const PageAddVideo({Key? key}) : super(key: key);

  @override
  _PageAddVideoState createState() => _PageAddVideoState();
}

class _PageAddVideoState extends State<PageAddVideo> {
  var textController = TextEditingController();
  FilePickerResult? fileVideo1;
  FilePickerResult? fileVideo2;
  FilePickerResult? fileVideo3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Partager vidéos',
          style: TextStyle(
              color: ColorsApp.primaryTextColorLight,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "PUBLIER",
                style: TextStyle(
                    color: ColorsApp.primaryTextColorLight,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(width: 10.0)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(9.0)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Ajout vidéos",
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.0)),
                    ),
                    SizedBox(height: 15.0),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        InkWell(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              width: 110.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: fileVideo1 == null
                                  ? Icon(Icons.video_call,
                                      color: Colors.white, size: 50.0)
                                  : InkWell(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                        child: Image.file(
                                          File(fileVideo1!.files
                                              .map((f) => f.path)
                                              .join(",")),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      onLongPress: () {
                                        customDialogue(context, "Supprimer",
                                            "Confirmer la suppression de l'image ?",
                                            text: "Confirmer",
                                            onPressed: () => {
                                                  setState(
                                                      () => fileVideo1 = null),
                                                  Navigator.pop(context)
                                                });
                                      },
                                    ),
                            ),
                            onTap: () async {
                              var image = await FilePicker.platform.pickFiles(
                                  dialogTitle: 'Images Fifete',
                                  onFileLoading: (value) {
                                    print(value);
                                  });
                              setState(() => fileVideo1 = image);
                            }),
                        InkWell(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              width: 110.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: fileVideo2 == null
                                  ? Icon(Icons.video_call,
                                      color: Colors.white, size: 50.0)
                                  : InkWell(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                        child: Image.file(
                                          File(fileVideo2!.files
                                              .map((f) => f.path)
                                              .join(",")),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      onLongPress: () {
                                        customDialogue(context, "Supprimer",
                                            "Confirmer la suppression de l'image ?",
                                            text: "Confirmer",
                                            onPressed: () => {
                                                  setState(
                                                      () => fileVideo2 = null),
                                                  Navigator.pop(context)
                                                });
                                      },
                                    ),
                            ),
                            onTap: () async {
                              var image = await FilePicker.platform.pickFiles(
                                  onFileLoading: (value) {
                                print(value);
                              });
                              setState(() => fileVideo2 = image);
                            }),
                        InkWell(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              width: 110.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: fileVideo3 == null
                                  ? Icon(Icons.video_call,
                                      color: Colors.white, size: 50.0)
                                  : InkWell(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                        child: Image.file(
                                          File(fileVideo3!.files
                                              .map((f) => f.path)
                                              .join(",")),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      onLongPress: () {
                                        customDialogue(context, "Supprimer",
                                            "Confirmer la suppression de l'image ?",
                                            text: "Confirmer",
                                            onPressed: () => {
                                                  setState(
                                                      () => fileVideo3 = null),
                                                  Navigator.pop(context)
                                                });
                                      },
                                    ),
                            ),
                            onTap: () async {
                              var image = await FilePicker.platform.pickFiles(
                                  onFileLoading: (value) {
                                print(value);
                              });
                              setState(() => fileVideo3 = image);
                            })
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
                    padding: EdgeInsets.all(25.0),
                    child: TextField(
                      controller: textController,
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
                      onPressed: () {},
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
}
