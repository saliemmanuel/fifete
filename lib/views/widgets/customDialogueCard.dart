import 'package:flutter/material.dart';

Future simpleDialogueCard(String title, String msg, BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 15.0),
              Expanded(child: Text(msg,overflow: TextOverflow.ellipsis)),
              SizedBox(width: 10.0)
            ],
          ),
        );
      });
}

Future simpleDialogueCardSansTitle(String msg, BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 15.0),
              Expanded(child: Text(msg,overflow: TextOverflow.ellipsis)),
              SizedBox(width: 10.0)
            ],
          ),
        );
      });
}

Future errorDialogueCard(String title, String msg, BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            ElevatedButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: 10.0)
          ],
        );
      });
}

customDialogue(BuildContext context, String title, String msg,
    {String? text, Function()? onPressed}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text("Annuler"),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: 10.0),
            ElevatedButton(
              child: Text(
                text ?? "Commencer",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onPressed,
            ),
            SizedBox(width: 10.0)
          ],
        );
      });
}
