import 'package:fifete/cofing/config.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class CustomDetailVideo extends StatefulWidget {
  final rubriqueTitle;
  final data;
  const CustomDetailVideo({
    Key? key,
    required this.rubriqueTitle,
    required this.data,
  }) : super(key: key);

  @override
  _CustomDetailVideoState createState() => _CustomDetailVideoState();
}

class _CustomDetailVideoState extends State<CustomDetailVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(widget.rubriqueTitle!,
            style: TextStyle(color: ColorsApp.primaryTextColorLight)),
      ),
      body: ListView(
        children: [
          Container(
            height: 250.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.data['cardImage'][0])),
                color: Colors.black),
            child: Center(
              child: InkWell(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                  child:
                      Icon(Icons.play_arrow, size: 25.0, color: Colors.white),
                ),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomHashTagText(
                  text: widget.data['labelCard'],
                  decoratedStyle: TextStyle(color: Colors.blue),
                  basicStyle: TextStyle(color: Colors.black),
                  enableOveflow: false,
                  enableExpandText: true,
                  firtTextToExpandedText: "  Afficher plus",
                  secondTextToExpandedText: '',
                ),
              ),
              IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => CustomBottomSheet.bottomSheet(context))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(widget.data['hour'] + "  " + widget.data['title']),
          ),
          SizedBox(height: 10.0),
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: ScrollPhysics(),
          //   itemCount: dataSheet.length,
          //   itemBuilder: (_, i) {
          //     return CustomCardVideo(listVideo: dataSheet[i]);
          //   },
          // ),
        ],
      ),
    );
  }
}
