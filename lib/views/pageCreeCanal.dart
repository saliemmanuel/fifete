import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/views/pageAcceuil.dart';
import 'package:flutter/material.dart';

import 'widgets/widget.dart';

class PageCreeCanal extends StatefulWidget {
  final UserModels? user;
  const PageCreeCanal({Key? key, this.user}) : super(key: key);

  @override
  _PageCreeCanalState createState() => _PageCreeCanalState();
}

class _PageCreeCanalState extends State<PageCreeCanal> {
  var nomCanalController = TextEditingController();
  Object typeCanal = 'Type canal';
  List? listTypeCanal = [
    'Informations',
    'Divertissements',
    'Technologies',
    'Arts et cultures'
  ];
  var service = ServiceApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Créer votre canal d\'information',
            style: TextStyle(color: ColorsApp.primaryTextColorLight),
          ),
        ),
        body: ListView(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text("Choisissez un nom pour votre canal.",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0),
                CustumTextField(
                  child: 'Nom canal',
                  controller: nomCanalController,
                  obscureText: false,
                  borderRadius: 0.0,
                  keyboardType: TextInputType.text,
                  backgroundColor: ColorsApp.bgTextFieldLogin,
                  hintTextColor: ColorsApp.primaryTextColorLight,
                ),
                SizedBox(height: 12.0),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.group,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 15.0),
                              Text(typeCanal.toString()),
                            ],
                          ),
                        ),
                        focusColor: Colors.black,
                        iconEnabledColor: Colors.black,
                        dropdownColor: Colors.white,
                        items: listTypeCanal!
                            .map((e) => DropdownMenuItem(
                                  child: Text(e,
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (newType) {
                          setState(() {
                            typeCanal = newType!;
                          });
                        }),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: ColorsApp.primaryColor,
                        child: Text(
                          'Créer canal',
                          style:
                              TextStyle(color: ColorsApp.primaryTextColorLight),
                        ),
                        onPressed: () {
                          if (nomCanalController.text.isEmpty)
                            errorDialogueCard('Erreur!',
                                "Choisissez un nom pour votre canal.", context);
                          if (typeCanal == "Type canal")
                            errorDialogueCard(
                                'Erreur!',
                                "Choisissez un type pour votre canal.",
                                context);
                          else {
                            service.createCanal(
                                nomCanalController.text,
                                widget.user!.gradeUtilisateur,
                                widget.user!.idUtilisateur,
                                typeCanal.toString(),
                                PageAcceuil(
                                    initialIndex: 3,
                                    user: widget.user,
                                    sharedText: null),
                                context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ]))
        ]));
  }
}
