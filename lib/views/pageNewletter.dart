import 'package:fifete/cofing/config.dart';
import 'package:fifete/utils/library/library.dart';

class PageNewLetter extends StatelessWidget {
  const PageNewLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Signaler un problème",
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(2.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20.0, bottom: 35.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: ColorsApp.primaryTextColorLight),
                          border: InputBorder.none,
                          hintText: 'Descriptions'),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: ColorsApp.primaryColor,
                        child: Text(
                          'Envoyer',
                          style:
                              TextStyle(color: ColorsApp.primaryTextColorLight),
                        ),
                        onPressed: () {
                          Alert(message: 'Effectué.').show();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
