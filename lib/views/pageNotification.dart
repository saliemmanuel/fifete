import 'package:fifete/api/api.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';

import 'widgets/widget.dart';

class PageNotification extends StatefulWidget {
  final UserModels? user;
  const PageNotification({Key? key, required this.user}) : super(key: key);

  @override
  _PageNotificationState createState() => _PageNotificationState();
}

class _PageNotificationState extends State<PageNotification> {
  var service = ServiceApi();
  var _listNotification;
  @override
  void initState() {
    getNotification();
    super.initState();
  }

  getNotification() async {
    try {
      _listNotification = await service.getAllNotification(context);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        children: [
          if (_listNotification == null)
            for (var o = 0; o < 3; o++)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer(
                      period: Duration(seconds: 7),
                      gradient:
                          LinearGradient(colors: [Colors.grey, Colors.white]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 4.0),
                        child: Column(
                          children: [
                            Container(
                              height: 55.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ],
                        ),
                      ))
                ],
              )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount:
                  _listNotification == null ? 0 : _listNotification.length,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: ListTile(
                          title: HashTagText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: _listNotification[i]['label_notification'],
                            decoratedStyle:
                                TextStyle(fontSize: 19.0, color: Colors.blue),
                            basicStyle:
                                TextStyle(fontSize: 19.0, color: Colors.black),
                          ),
                          subtitle: Text(service.formatDate(
                              _listNotification[i]['heur_notification'])),
                        ),
                      ),
                      onTap: () => pushNewPage(
                          CustomDetailActualite(
                            initialIndex: 2,
                            rubriqueTitle: 'Actualités',
                            actuality: ActualityModels(
                                idActualite: _listNotification[i]
                                    ['id_actualite'],
                                titreActualite: _listNotification[i]
                                    ['titre_actualite'],
                                heureActualite: _listNotification[i]
                                    ['heure_actualite'],
                                imagesActualite: _listNotification[i]
                                    ['images_actualite'],
                                descriptionActualite: _listNotification[i]
                                    ['description_actualite']),
                            enableOveflow: true,
                            enableExpandText: true,
                            user: widget.user,
                          ),
                          context),
                    ),
                  ],
                );
              },
            )
        ],
      ),
      onRefresh: () => getNotification(),
    );
  }
}
