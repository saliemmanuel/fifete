import 'dart:async';

import 'package:fifete/cofing/config.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class CustomDot extends StatefulWidget {
  final nextPage;

  const CustomDot({Key? key, required this.nextPage}) : super(key: key);
  @override
  _CustomDotState createState() => _CustomDotState();
}

class _CustomDotState extends State<CustomDot> {
  bool? activ1 = false;
  bool? activ2 = false;
  bool? activ3 = false;
  bool? activ4 = false;
  bool? activ5 = false;
  bool? activ6 = false;

  @override
  void initState() {
    launchDot();
    super.initState();
  }

  launchDot() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == 1) activ1 = true;

      if (timer.tick == 2)
        setState(() {
          activ2 = true;
          activ3 = true;
          activ4 = true;
        });

      if (timer.tick == 3)
        setState(() {
          activ5 = true;
        });

      if (timer.tick == 4)
        setState(() {
          activ6 = true;
          pushNewPageRemoveUntil(widget.nextPage, context);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activ1! ? ColorsApp.primaryColor : ColorsApp.greyColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activ2! ? ColorsApp.primaryColor : ColorsApp.greyColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activ3! ? ColorsApp.primaryColor : ColorsApp.greyColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activ4! ? ColorsApp.primaryColor : ColorsApp.greyColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activ5! ? ColorsApp.primaryColor : ColorsApp.greyColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activ6! ? ColorsApp.primaryColor : ColorsApp.greyColor),
          ),
        ),
      ],
    );
  }
}
