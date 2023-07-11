import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';

import 'widgets/widget.dart';
import 'wiews.dart';

class PageSplash extends StatefulWidget {
  final List? user;
  const PageSplash({Key? key, required this.user}) : super(key: key);

  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  // List<SharedMediaFile> sharedFiles = [];
  String? sharedText;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ReceiveSharingIntent.getMediaStream().listen((List<SharedMediaFile> value) {
    //   setState(() => sharedFiles = value);
    // }).asFuture();

    // ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
    //   setState(() => sharedFiles = value);
    // });

   

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 6),
            CircleAvatar(
              radius: 68.0,
              backgroundColor: Colors.transparent,
              child: Image.asset(ImageAsset.logoSansBordure, height: 25.0),
            ),
            Spacer(flex: 2),
            CustomDot(
                nextPage: PageAcceuil(
              user: UserModels(
                idUtilisateur: "1",
                nomUtilisateur: "widget.user![0]['nomUtilisateur']",
                prenomUtilisateur: "widget.user![0]['prenomUtilisateur']",
                emailUtilisateur: "widget.user![0]['emailUtilisateur']",
                gradeUtilisateur: "widget.user![0]['gradeUtilisateur']",
                session: "widget.user![0]['session']",
                telephoneUtilisateur: "widget.user![0]['telephoneUtilisateur']",
              ),
              initialIndex: 0,
              sharedText: sharedText,
            )),
            Spacer(flex: 3),
            Text(
              'Coton Sport Store',
              style: TextStyle(
                  color: ColorsApp.primaryColor,
                  fontSize: 18.0,
                  letterSpacing: 8,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
