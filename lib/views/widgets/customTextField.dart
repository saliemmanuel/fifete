import 'package:fifete/cofing/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustumTextField extends StatefulWidget {
  final String? child;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final double? borderRadius;
  final double? fontSize;
  final Color? textColor;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;

  const CustumTextField(
      {Key? key,
      this.child,
      this.borderRadius,
      this.fontSize,
      this.textColor,
      this.backgroundColor,
      this.controller,
      this.obscureText,
      this.hintTextColor,
      required this.keyboardType})
      : assert(child != null, 'child ne doit être different de null'),
        super(key: key);

  @override
  _CustumTextFieldState createState() => _CustumTextFieldState();
}

class _CustumTextFieldState extends State<CustumTextField> {
  bool obscure = false;
  @override
  void initState() {
    obscure = widget.obscureText!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.0,
      decoration: BoxDecoration(
          borderRadius: widget.borderRadius == null
              ? BorderRadius.circular(15.0)
              : BorderRadius.circular(widget.borderRadius!),
          color: widget.backgroundColor ?? Colors.white,
          border: Border.all(
              color: widget.backgroundColor ?? ColorsApp.primaryColor)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: TextFormField(
              textInputAction: TextInputAction.newline,
              obscureText: obscure == false ? false : true,
              autocorrect: true,
              controller: widget.controller,
              cursorHeight: 19,
              keyboardType: widget.keyboardType,
              style: TextStyle(color: Colors.white),
              cursorColor: ColorsApp.primaryColor,
              decoration: InputDecoration(
                hintText: widget.child,
                hintStyle: TextStyle(
                    color: widget.hintTextColor ?? Colors.black,
                    fontSize: 18.0),
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                suffixIcon: widget.obscureText == true
                    ? IconButton(
                        icon: obscure
                            ? Icon(Icons.visibility_off,
                                color: widget.backgroundColor == null
                                    ? ColorsApp.primaryColor
                                    : Colors.white)
                            : Icon(Icons.visibility,
                                color: widget.backgroundColor == null
                                    ? ColorsApp.primaryColor
                                    : Colors.white),
                        onPressed: () {
                          setState(() {
                            this.obscure = !obscure;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ),
      )),
    );
  }
}
//

class CustumCommentaireTextField extends StatefulWidget {
  final String? child;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final double? borderRadius;
  final double? fontSize;
  final Color? textColor;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;

  const CustumCommentaireTextField(
      {Key? key,
      this.child,
      this.borderRadius,
      this.fontSize,
      this.textColor,
      this.backgroundColor,
      this.controller,
      this.obscureText,
      this.hintTextColor,
      required this.keyboardType,
      this.onChanged})
      : assert(child != null, 'child ne doit être different de null'),
        super(key: key);

  @override
  _CustumCommentaireTextFieldState createState() =>
      _CustumCommentaireTextFieldState();
}

class _CustumCommentaireTextFieldState
    extends State<CustumCommentaireTextField> {
  bool obscure = false;
  @override
  void initState() {
    obscure = widget.obscureText!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.0,
      decoration: BoxDecoration(
          borderRadius: widget.borderRadius == null
              ? BorderRadius.circular(15.0)
              : BorderRadius.circular(widget.borderRadius!),
          color: widget.backgroundColor ?? Colors.white,
          border: Border.all(
              color: widget.backgroundColor ?? ColorsApp.primaryColor)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CupertinoScrollbar(
          child: TextField(
            onChanged: widget.onChanged,
            minLines: 1,
            maxLines: 3,
            scrollPhysics: ScrollPhysics(),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            obscureText: obscure == false ? false : true,
            autocorrect: true,
            controller: widget.controller,
            cursorColor: ColorsApp.primaryColor,
            decoration: InputDecoration(
              hintText: widget.child,
              hintStyle: TextStyle(
                  color: widget.hintTextColor ?? Colors.black, fontSize: 18.0),
              disabledBorder: InputBorder.none,
              border: InputBorder.none,
              suffixIcon: widget.obscureText == true
                  ? IconButton(
                      icon: obscure
                          ? Icon(Icons.visibility_off,
                              color: widget.backgroundColor == null
                                  ? ColorsApp.primaryColor
                                  : Colors.white)
                          : Icon(Icons.visibility,
                              color: widget.backgroundColor == null
                                  ? ColorsApp.primaryColor
                                  : Colors.white),
                      onPressed: () {
                        setState(() {
                          this.obscure = !obscure;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      )),
    );
  }
}
