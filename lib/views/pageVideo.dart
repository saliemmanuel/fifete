// import 'package:better_player/better_player.dart';
import 'package:fifete/api/api.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'widgets/widget.dart';

class PageVideo extends StatefulWidget {
  const PageVideo({Key? key}) : super(key: key);

  @override
  _PageVideoState createState() => _PageVideoState();
}

class _PageVideoState extends State<PageVideo> {
  var service = ServiceApi();
  var host = Host();
  var _listVideo;

  late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    getNotification();

    super.initState();
  }

  getNotification() async {
    try {
      _listVideo = await service.getAllVideo(context);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 15.0, bottom: 3.0),
          child: Text(
            'Vidéos',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                wordSpacing: 11.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        _listVideo != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 15.0),
                  Text("Chargement ...")
                ],
              )
            : ListView(
                shrinkWrap: true,
              )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
