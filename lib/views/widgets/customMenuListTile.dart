import 'package:flutter/material.dart';

class CustomMenuListTile extends StatefulWidget {
  final title;
  final icon;
  final Function()? onTap;
  const CustomMenuListTile({Key? key, this.title, this.icon, this.onTap})
      : super(key: key);

  @override
  _CustomMenuListTileState createState() => _CustomMenuListTileState();
}

class _CustomMenuListTileState extends State<CustomMenuListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: widget.icon,
          ),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          ),
          onTap: widget.onTap,
        ),
        Divider(),
      ],
    );
  }
}
