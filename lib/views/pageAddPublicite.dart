import 'package:fifete/cofing/config.dart';
import 'package:flutter/material.dart';

class PageAddPublicite extends StatefulWidget {
  const PageAddPublicite({Key? key}) : super(key: key);

  @override
  _PageAddPubliciteState createState() => _PageAddPubliciteState();
}

class _PageAddPubliciteState extends State<PageAddPublicite> {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Partager publicités',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(2.0)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Ajouter des photos",
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.0)),
                    ),
                    SizedBox(height: 15.0),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...List.generate(
                            3,
                            (index) => Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(2.0)),
                                  child: Icon(Icons.image,
                                      color: Colors.white, size: 50.0),
                                ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(2.0)),
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
