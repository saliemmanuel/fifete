import 'package:fifete/utils/library/library.dart';

class TailleArticleWidget extends StatefulWidget {
  final String? label;
  const TailleArticleWidget({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  State<TailleArticleWidget> createState() => _TailleArticleWidgetState();
}

class _TailleArticleWidgetState extends State<TailleArticleWidget> {
  bool? isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        height: 50.0,
        width: 50.0,
        child: Text(widget.label!),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border:
                isSelected! ? Border.all(color: Colors.grey, width: 2.0) : null,
            borderRadius: BorderRadius.circular(15.0)),
      ),
      onTap: () {
        isSelected = !isSelected!;
        setState(() {});
      },
    );
  }
}
