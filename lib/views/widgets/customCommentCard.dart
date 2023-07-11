import 'package:fifete/cofing/config.dart';
import 'package:flutter/material.dart';

class CustomCommentCard extends StatelessWidget {
  final String? title;
  final String? hour;
  final String? contenusCommentaire;
  const CustomCommentCard(
      {Key? key,
      required this.title,
      required this.hour,
      required this.contenusCommentaire})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(ImageAsset.logoSansBordure),
              maxRadius: 25.0),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: ColorsApp.primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  title: Text(title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(hour! + "\n$contenusCommentaire"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
