import 'package:fifete/cofing/palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? numberReaction;
  final IconData? iconButton;
  final bool? isClick;
  final Function()? onPressed;
  const CustomButton(
      {Key? key,
      required this.numberReaction,
      this.onPressed,
      required this.iconButton,
      this.isClick = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          child: Container(
              alignment: Alignment.center,
              height: 42.0,
              decoration: BoxDecoration(
                  color: isClick!
                      ? ColorsApp.primaryColor.withOpacity(0.8)
                      : ColorsApp.chipBackgroungColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconButton),
                  SizedBox(width: 8.0),
                  numberReaction == null ? SizedBox() : Text(numberReaction!),
                ],
              )),
          onTap: onPressed,
        ),
      ),
    );
  }
}
