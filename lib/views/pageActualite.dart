import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';

import 'widgets/widget.dart';

class PageActualite extends StatefulWidget {
  final UserModels? user;

  const PageActualite({Key? key, required this.user}) : super(key: key);
  @override
  _PageActualiteState createState() => _PageActualiteState();
}

class _PageActualiteState extends State<PageActualite> {
  var serviceApi = ServiceApi();
  var _listActualite;
  @override
  void initState() {
    getActuality();
    super.initState();
  }

  getActuality() async {
    try {
      // _listActualite = await serviceApi.getAllActuality(context);
      _listActualite = [{"id_actualite": "2", "titre_actualite": "PREMIUM LES MAILLOT DES JOEUR DE COTON SPORT DISPONIBLE", "description_actualite": "PREMIUM LES MAILLOT DES JOEUR DE COTON SPORT DISPONIBLE", "heure_actualite": "2022-09-05:13-52-43", "images_actualite": "assets/images/image_10.jpg", "id_utilisateur": "1"}, 
      {"id_actualite": "1", "titre_actualite": "Première actualité coton sport apk" , "description_actualite": "ici la description de l'actualité", "heure_actualite": "2022-09-05:13-50-49", "images_actualite": "assets/images/image_5.jpg", "id_utilisateur": "1"}];
      print(_listActualite);
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
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 15.0, bottom: 3.0),
            child: Text(
              'Actualités',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  wordSpacing: 11.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          if (_listActualite == null)
            for (var o = 0; o < 3; o++) CustomShimmerActualityCard()
          else
            ListView.builder(
              shrinkWrap: true,
              itemCount: _listActualite != null ? _listActualite.length : 0,
              physics: ScrollPhysics(),
              itemBuilder: (_, i) {
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomNewsCard(
                      actuality: ActualityModels(
                          idActualite: _listActualite[i]['id_actualite'],
                          titreActualite: _listActualite[i]['titre_actualite'],
                          heureActualite: _listActualite[i]['heure_actualite'],
                          imagesActualite: _listActualite[i]
                              ['images_actualite'],
                          descriptionActualite: _listActualite[i]
                              ['description_actualite']),
                      enableOveflow: true,
                      enableExpandText: false,
                      photoViewIsEnable: true,
                      user: widget.user,
                      enableDescription: true,
                    ),
                  ),
                  onTap: () => pushNewPage(
                      CustomDetailActualite(
                        initialIndex: 0,
                        rubriqueTitle: 'Actualités',
                        actuality: ActualityModels(
                          idActualite: _listActualite[i]['id_actualite'],
                          titreActualite: _listActualite[i]['titre_actualite'],
                          heureActualite: _listActualite[i]['heure_actualite'],
                          imagesActualite: _listActualite[i]
                              ['images_actualite'],
                          descriptionActualite: _listActualite[i]
                              ['description_actualite'],
                        ),
                        enableOveflow: true,
                        enableExpandText: true,
                        user: widget.user,
                      ),
                      context),
                );
              },
            )
        ],
      ),
      onRefresh: () => getActuality(),
    );
  }
}
