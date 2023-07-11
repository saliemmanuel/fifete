import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final String? text;
  final double? fontSize;
  final double? iconSize;
  const CustomListTile(
      {Key? key,
      this.onTap,
      required this.icon,
      required this.text,
      this.fontSize,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Icon(icon, size: iconSize ?? 20),
            title: Text(text!, style: TextStyle(fontSize: fontSize ?? 12)),
            onTap: onTap),
        Divider(height: 0),
      ],
    );
  }
}
