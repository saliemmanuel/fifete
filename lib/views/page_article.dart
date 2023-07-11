import 'package:fifete/api/api.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:fifete/views/page_detail_article.dart';
import 'package:fifete/views/widgets/widget.dart';

import 'widgets/custom_article_card.dart';

class PageArticle extends StatefulWidget {
  final UserModels? user;
  const PageArticle({Key? key, required this.user}) : super(key: key);

  @override
  _PageArticleState createState() => _PageArticleState();
}

class _PageArticleState extends State<PageArticle> {
  var service = ServiceApi();
  var _listFavoris;
  @override
  void initState() {
    getAllFavoris();
    super.initState();
  }

  getAllFavoris() async {
    try {
      _listFavoris =
          await service.getFavoris(widget.user!.idUtilisateur, context);
      setState(() {});
      print(_listFavoris);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var listItem = [
      {
        'nom': 'Kamilou Daouda',
        'description': 'Maillot de la légende du Club Kamilou Daouda',
        'taille': 'XL',
        'couleur': 'verte',
        'disponibilite': 'disponible',
        'prix': '20000 XAF',
        'images': "assets/images/image_5.jpg",
      },
      {
        'nom': 'Tombi alemi',
        'description': 'Maillot de la légende du Club Tombi alemi',
        'taille': 'XL',
        'couleur': 'verte',
        'disponibilite': 'disponible',
        'prix': '20000 XAF',
        'images': "assets/images/image_5.jpg",
      },
      {
        'nom': 'OUKINE FELIX',
        'description': 'Maillot de la légende du Club OUKINE FELIX',
        'taille': 'XL',
        'couleur': 'verte',
        'disponibilite': 'disponible',
        'prix': '20000 XAF',
        'images': "assets/images/image_5.jpg",
      },
     
    ];
    return RefreshIndicator(
      child: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: listItem.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => CustomArticleCard(
              image: listItem[index]['images']!,
              data: listItem[index],
              onTap: () {
                pushNewPage(
                    PageDetailArticle(
                      listImage: listItem[index]['image'],
                      data: listItem[index],
                    ),
                    context);
              },
            ),
          ),
        ],
      ),
      onRefresh: () {
        _listFavoris = null;
        return getAllFavoris();
      },
    );
  }
}
