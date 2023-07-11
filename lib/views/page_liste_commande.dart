import 'package:fifete/cofing/config.dart';
import 'package:fifete/utils/library/library.dart';

class PageListeCommande extends StatefulWidget {
  const PageListeCommande({Key? key}) : super(key: key);

  @override
  State<PageListeCommande> createState() => _PageListeCommandeState();
}

class _PageListeCommandeState extends State<PageListeCommande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Vos commandes',
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
