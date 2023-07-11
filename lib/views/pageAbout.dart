import 'package:fifete/cofing/config.dart';
import 'package:fifete/utils/library/library.dart';

// e mail job@bloosat.com
class PageAbout extends StatelessWidget {
  const PageAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'A propos',
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Dans un environnement en pleine mutation sur le plan technologique, les usages ont considérablement évolué notamment sur les moyens de collecter les dons, legs et autres et l’accès aux produits du club. Dans le but de porter toujours plus haut son ambition, COTON SPORT DE GAROUA a souhaité se doter d’un outil pouvant lui permettre d’apporter plus flexibilité, de fluidité à ses supporters qui pourront à distance procéder au paiement des gadgets et la collecte des legs en sélectionnant le moyen de paiement de leur choix. Ce projet intervient dans le cadre de la mise sur pied d’une application mobile de collecte des fonds, legs par coton sport de Garoua et vente en ligne des maillots et autres gadgets du club lié au site web.""",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(var _url) async {
    if (!await launch(
      _url,
    )) throw 'Could not launch $_url';
  }
}
