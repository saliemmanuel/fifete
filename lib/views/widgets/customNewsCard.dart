import 'package:cached_network_image/cached_network_image.dart';
import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:flutter/services.dart';

import 'widget.dart';

class CustomNewsCard extends StatefulWidget {
  final ActualityModels? actuality;
  final UserModels? user;

  final bool? enableOveflow;
  final bool? enableExpandText;
  final bool? photoViewIsEnable;
  final Function()? onPressed;
  final Function()? photoView;
  final bool? enableDescription;

  const CustomNewsCard({
    Key? key,
    required this.actuality,
    this.onPressed,
    this.enableOveflow,
    required this.enableExpandText,
    required this.photoViewIsEnable,
    this.photoView,
    required this.user,
    required this.enableDescription,
  }) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<CustomNewsCard> {
  var host = Host();
  var service = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: !widget.enableDescription!,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
            child: CustomHashTagText(
              text: widget.actuality!.descriptionActualite,
              decoratedStyle: TextStyle(fontSize: 17.0, color: Colors.blue),
              basicStyle: TextStyle(fontSize: 17.0, color: Colors.black),
              enableExpandText: widget.enableExpandText,
              enableOveflow: widget.enableOveflow,
              firtTextToExpandedText: "  Afficher plus",
              secondTextToExpandedText: '',
            ),
          ),
        ),
        Stack(
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: InkWell(
                  child: Container(
                    height: 250,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                            height: 250,
                            // child: CachedNetworkImage(
                            //   imageUrl: host.url() +
                            //       widget.actuality!.imagesActualite!,
                            //   fadeOutDuration:
                            //       const Duration(milliseconds: 900),
                            //   fit: BoxFit.cover,
                            //   errorWidget: (_, c, e) {
                            //     return Center(
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child:
                            //             Icon(Icons.broken_image, size: 90.0),
                            //       ),
                            //     );
                            //   },
                            // )
                            child:
                                Image.asset(widget.actuality!.imagesActualite!,fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            height: 150.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 80.0, left: 10.0),
                              child: Visibility(
                                child: CustomHashTagText(
                                  text: widget.actuality!.titreActualite,
                                  decoratedStyle: TextStyle(
                                      fontSize: 17.0, color: Colors.blue),
                                  basicStyle: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                  enableExpandText: widget.enableExpandText,
                                  enableOveflow: widget.enableOveflow,
                                  firtTextToExpandedText: 'Afficher plus',
                                  secondTextToExpandedText: '',
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
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
                                borderRadius: BorderRadius.circular(25.0)),
                            alignment: Alignment.bottomCenter,
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: widget.photoViewIsEnable! ? widget.photoView : null,
                ),
              ),
              onTap: widget.onPressed,
            ),
            Positioned(
              top: 20.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                    child: Text(
                        service.formatDate(widget.actuality!.heureActualite!),
                        style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        const Divider(),
      ],
    );
  }
}
