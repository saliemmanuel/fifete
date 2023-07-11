//Ici page pour recevoir les donnees
//tel que Image video et Actualié

import 'package:fifete/cofing/config.dart';
import 'package:flutter/material.dart';

import 'package:fifete/utils/library/library.dart';

class PageReceiveData extends StatefulWidget {
  final String? sharedText;
  const PageReceiveData({
    Key? key,
    required this.sharedText,
  }) : super(key: key);

  @override
  _PageReceiveDataState createState() => _PageReceiveDataState();
}

class _PageReceiveDataState extends State<PageReceiveData> {
  late var textController;
  var scrollController = ScrollController();
  @override
  void initState() {
    textController = TextEditingController(text: widget.sharedText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Partager sur Fifete',
          style: TextStyle(
              color: ColorsApp.primaryTextColorLight,
              fontWeight: FontWeight.bold),
        ),
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
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Ajouter des Images",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ),
                    SizedBox(height: 10.0),
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    child: TextField(
                      controller: textController,
                      minLines: 1,
                      maxLines: null,
                      scrollController: scrollController,
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
                        'Partager',
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
