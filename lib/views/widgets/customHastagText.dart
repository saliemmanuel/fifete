import 'package:fifete/utils/library/library.dart';

class CustomHashTagText extends StatefulWidget {
  CustomHashTagText(
      {required this.basicStyle,
      required this.decoratedStyle,
      this.decorateAtSign = false,
      this.onTap,
      this.textAlign = TextAlign.start,
      this.textDirection,
      this.softWrap = true,
      this.overflow = TextOverflow.clip,
      this.textScaleFactor = 1.0,
      this.maxLines,
      this.locale,
      this.strutStyle,
      this.textWidthBasis = TextWidthBasis.parent,
      this.textHeightBehavior,
      required this.enableOveflow,
      required this.enableExpandText,
      required this.firtTextToExpandedText,
      required this.secondTextToExpandedText,
      this.text});

  final TextStyle basicStyle;
  final TextStyle decoratedStyle;
  final Function(String)? onTap;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? text;
  final bool decorateAtSign;
  final bool? enableOveflow;
  final String? firtTextToExpandedText;
  final String? secondTextToExpandedText;

  final bool? enableExpandText;

  @override
  _CustomHashTagTextState createState() => _CustomHashTagTextState();
}

class _CustomHashTagTextState extends State<CustomHashTagText> {
  bool flag = true;
  String? secondHalf;
  String? firstHalf;
  @override
  void initState() {
    int x = (widget.text!.substring(0, widget.text!.length).length / 2)
        .truncate()
        .toInt();
    if (x > 25) {
      firstHalf = '''${widget.text!.substring(0, x)}''';
      secondHalf = '''${widget.text!.substring(x, widget.text!.length)}''';
    } else {
      firstHalf = widget.text!;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          child: RichText(
            text: TextSpan(children: [
              getHashTagTextSpan(
                decoratedStyle: widget.decoratedStyle,
                decorateAtSign: widget.decorateAtSign,
                basicStyle: widget.basicStyle,
                onTap: widget.onTap,
                source: flag
                    ? ('''$firstHalf''' + '...')
                    : (firstHalf! + secondHalf!),
              ),
              TextSpan(
                text: widget.enableOveflow!
                    ? flag
                        ? widget.firtTextToExpandedText
                        : widget.secondTextToExpandedText
                    : "",
                style: TextStyle(color: Colors.grey),
              ),
            ]),
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            softWrap: widget.softWrap,
            overflow: widget.overflow,
            textScaleFactor: widget.textScaleFactor,
            maxLines: widget.maxLines,
            locale: widget.locale,
            strutStyle: widget.strutStyle,
            textWidthBasis: widget.textWidthBasis,
            textHeightBehavior: widget.textHeightBehavior,
          ),
          onTap: widget.enableExpandText!
              ? () {
                  flag = !flag;
                  setState(() {});
                }
              : null,
        ),
      ),
    );
  }

  bool hasHashTags(String value) {
    final decoratedTextColor = Colors.blue;
    final detector = Detector(
        textStyle: TextStyle(),
        decoratedStyle: TextStyle(color: decoratedTextColor));
    final result = detector.getDetections(value);
    final detections = result
        .where((detection) => detection.style!.color == decoratedTextColor)
        .toList();
    return detections.isNotEmpty;
  }

  List<String> extractHashTags(String value) {
    final decoratedTextColor = Colors.blue;
    final detector = Detector(
        textStyle: TextStyle(),
        decoratedStyle: TextStyle(color: decoratedTextColor));
    final detections = detector.getDetections(value);
    final taggedDetections = detections
        .where((detection) => detection.style!.color == decoratedTextColor)
        .toList();
    final result = taggedDetections.map((decoration) {
      final text = decoration.range.textInside(value);
      return text.trim();
    }).toList();
    return result;
  }

  TextSpan getHashTagTextSpan({
    required TextStyle decoratedStyle,
    required TextStyle basicStyle,
    required String source,
    Function(String)? onTap,
    bool decorateAtSign = false,
  }) {
    final decorations = Detector(
            decoratedStyle: decoratedStyle,
            textStyle: basicStyle,
            decorateAtSign: decorateAtSign)
        .getDetections(source);
    if (decorations.isEmpty) {
      return TextSpan(text: source, style: basicStyle);
    } else {
      decorations.sort();
      final span = decorations
          .asMap()
          .map(
            (index, item) {
              final recognizer = TapGestureRecognizer()
                ..onTap = () {
                  final decoration = decorations[index];
                  if (decoration.style == decoratedStyle) {
                    onTap!(decoration.range.textInside(source).trim());
                  }
                };
              return MapEntry(
                index,
                TextSpan(
                  style: item.style,
                  text: item.range.textInside(source),
                  recognizer: (onTap == null) ? null : recognizer,
                ),
              );
            },
          )
          .values
          .toList();

      return TextSpan(children: span);
    }
  }
}
