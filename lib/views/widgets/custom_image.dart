import 'package:flutter/material.dart';

import 'custom_article_card.dart';

class CustomImage extends StatelessWidget {
  final String nom;
  const CustomImage(this.image,
      {Key? key,
      this.width = 100,
      this.height = 100,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.fit = BoxFit.cover,
      this.isNetwork = true,
      this.radius = 50,
      this.borderRadius,
      this.isShadow = true,
      required this.nom})
      : super(key: key);
  final String image;
  final double width;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: fit,
        ),
        color: bgColor,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          if (isShadow)
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
            ),
        ],
      ),
      child: SizedBox(
        height: 50,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.8),
                        Colors.black,
                      ]),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
            Positioned(
              bottom: 15.0,
              left: 25.0,
              right: 0.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nom,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          color: Colors.white),
                    ),
                    generateStart(info: "", count: 2),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
