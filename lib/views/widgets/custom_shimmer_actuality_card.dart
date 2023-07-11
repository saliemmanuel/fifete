import 'package:fifete/utils/library/library.dart';
import 'package:flutter/material.dart';

class CustomShimmerActualityCard extends StatefulWidget {
  const CustomShimmerActualityCard({Key? key}) : super(key: key);

  @override
  State<CustomShimmerActualityCard> createState() =>
      CustomShimmerActualityCardState();
}

class CustomShimmerActualityCardState
    extends State<CustomShimmerActualityCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      period: Duration(seconds: 7),
      gradient: LinearGradient(colors: [Colors.grey, Colors.white]),
      child: Column(
        children: [
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
                            child: Container(height: 250.0),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              height: 150.0,
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 80.0)),
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
                  ),
                ),
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
                      width: 75.0,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(),
        ],
      ),
    );
  }
}
