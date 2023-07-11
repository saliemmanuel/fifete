import 'dart:io';

import 'package:fifete/utils/library/library.dart';

import 'widget.dart';

class ImageCard extends StatefulWidget {
  final File? fileImage;

  const ImageCard({Key? key, required this.fileImage}) : super(key: key);
  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        width: 90.0,
        height: 90.0,
        decoration: BoxDecoration(
            image: widget.fileImage != null
                ? DecorationImage(
                    image: FileImage(widget.fileImage!), fit: BoxFit.cover)
                : null,
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(9.0)),
        child: widget.fileImage == null
            ? Icon(Icons.image, color: Colors.white, size: 25.0)
            // : ClipRRect(
            //     borderRadius: BorderRadius.circular(9.0),
            //     child: Image.file(widget.fileImage!),
            //   ),
            : SizedBox());
  }
}
