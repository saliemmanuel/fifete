import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:fifete/views/wiews.dart';

class PageUpdateActualite extends StatefulWidget {
  final UserModels? user;
  final String? newDescription;
  final String? idActualite;
  final CanalModels canal;
  const PageUpdateActualite(
      {Key? key,
      required this.user,
      required this.newDescription,
      required this.idActualite,
      required this.canal})
      : super(key: key);

  @override
  _PageUpdateActualiteState createState() => _PageUpdateActualiteState();
}

class _PageUpdateActualiteState extends State<PageUpdateActualite> {
  var service = ServiceApi();
  @override
  Widget build(BuildContext context) {
    var description = TextEditingController(text: widget.newDescription);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Modifier actualités',
          style: TextStyle(
              color: ColorsApp.primaryTextColorLight,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(9.0)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: description,
                      minLines: 1,
                      maxLines: null,
                      scrollPhysics: ScrollPhysics(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: ColorsApp.primaryTextColorLight),
                          border: InputBorder.none,
                          hintText: 'Descriptions'),
                    ),
                  )),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: ColorsApp.primaryColor,
                      child: Text(
                        'Modifier',
                        style:
                            TextStyle(color: ColorsApp.primaryTextColorLight),
                      ),
                      onPressed: () {
                        service.updateActualite(
                            newDescription: description.text,
                            idActualite: widget.idActualite,
                            page: PageGestionCanal(
                                canal: widget.canal, user: widget.user),
                            context: context);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
