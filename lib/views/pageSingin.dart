import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:flutter/material.dart';

import 'widgets/widget.dart';
import 'wiews.dart';

class PageSingin extends StatefulWidget {
  const PageSingin({Key? key}) : super(key: key);

  @override
  _PageSinginState createState() => _PageSinginState();
}

class _PageSinginState extends State<PageSingin> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var serviceApi = new ServiceApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fifete',
          style: TextStyle(color: ColorsApp.primaryTextColorLight),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10.0),
                CustumTextField(
                  child: 'E-mail',
                  controller: emailController,
                  obscureText: false,
                  borderRadius: 0.0,
                  keyboardType: TextInputType.emailAddress,
                  backgroundColor: ColorsApp.bgTextFieldLogin,
                  hintTextColor: ColorsApp.primaryTextColorLight,
                ),
                SizedBox(height: 10.0),
                CustumTextField(
                  child: 'Mots de passe',
                  controller: passController,
                  obscureText: true,
                  borderRadius: 0.0,
                  keyboardType: TextInputType.text,
                  backgroundColor: ColorsApp.bgTextFieldLogin,
                  hintTextColor: ColorsApp.primaryTextColorLight,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                    color: ColorsApp.primaryColor,
                    child: Text(
                      "Se connecter",
                      style: TextStyle(color: ColorsApp.primaryTextColorLight),
                    ),
                    onPressed: () {
                      if (emailController.text.isEmpty ||
                          passController.text.isEmpty)
                        errorDialogueCard("Erreur",
                            "Entrez e-mail et un mots de passe svp.", context);
                      else if (!emailController.text.contains("@")) {
                        errorDialogueCard("Erreur", "E-mail invalide", context);
                      } else
                        serviceApi.getSingIn(
                            email: emailController.text,
                            mdp: passController.text,
                            context: context);
                    }),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(child: Divider(height: 0.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text("ou"),
                    ),
                    Expanded(child: Divider(height: 0.0)),
                  ],
                ),
                SizedBox(height: 10.0),
                MaterialButton(
                  color: Colors.blue,
                  child: Text('Créer un compte',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () => customDialogue(
                    context,
                    "Créer un compte Fifete",
                    "Nous allons vous aidez à créer votre compte Fifete",
                    onPressed: () =>
                        pushNewPageRemoveUntil(PageSignup(), context),
                  ),
                  //
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
