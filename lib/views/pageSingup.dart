import 'package:fifete/api/api.dart';
import 'package:fifete/cofing/config.dart';
import 'package:flutter/material.dart';

import 'widgets/widget.dart';
import 'wiews.dart';

class PageSignup extends StatefulWidget {
  const PageSignup({Key? key}) : super(key: key);

  @override
  PageSignupState createState() => PageSignupState();
}

class PageSignupState extends State<PageSignup> {
  var nomControler = TextEditingController();
  var prenomControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fifete',
          style: TextStyle(
            color: ColorsApp.primaryTextColorLight,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Comment vous appelez-vous ?",
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0),
                CustumTextField(
                  child: 'Nom',
                  controller: nomControler,
                  obscureText: false,
                  borderRadius: 0.0,
                  keyboardType: TextInputType.text,
                  backgroundColor: ColorsApp.bgTextFieldLogin,
                  hintTextColor: ColorsApp.primaryTextColorLight,
                ),
                SizedBox(height: 10.0),
                CustumTextField(
                  child: 'Prénom',
                  controller: prenomControler,
                  obscureText: false,
                  borderRadius: 0.0,
                  keyboardType: TextInputType.text,
                  backgroundColor: ColorsApp.bgTextFieldLogin,
                  hintTextColor: ColorsApp.primaryTextColorLight,
                ),
                SizedBox(height: 10.0),
                MaterialButton(
                    color: ColorsApp.primaryColor,
                    child: Text(
                      "Suivant",
                      style: TextStyle(color: ColorsApp.primaryTextColorLight),
                    ),
                    onPressed: () {
                      if (nomControler.text.isEmpty ||
                          prenomControler.text.isEmpty)
                        errorDialogueCard("Erreur",
                            "Remplissez tous les champs svp.", context);
                      else
                        pushNewPage(
                            SecondSingup(
                              nom: nomControler.text,
                              prenom: prenomControler.text,
                            ),
                            context);
                    }),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(child: Divider(height: 0.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text("Avez-vous déjà un compte ?"),
                    ),
                    Expanded(child: Divider(height: 0.0)),
                  ],
                ),
                SizedBox(height: 10.0),
                MaterialButton(
                  color: Colors.blue,
                  child: Text('Se connecter',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () =>
                      pushNewPageRemoveUntil(PageSingin(), context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondSingup extends StatefulWidget {
  final String? nom, prenom;
  const SecondSingup({Key? key, required this.nom, required this.prenom})
      : super(key: key);

  @override
  State<SecondSingup> createState() => _SecondSingupState();
}

class _SecondSingupState extends State<SecondSingup> {
  var passController = TextEditingController();
  var conPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fifete',
          style: TextStyle(
            color: ColorsApp.primaryTextColorLight,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Choisissez un mots de passe",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
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
                SizedBox(height: 10.0),
                CustumTextField(
                  child: 'Confirmer mots de passe',
                  controller: conPassController,
                  obscureText: true,
                  borderRadius: 0.0,
                  keyboardType: TextInputType.text,
                  backgroundColor: ColorsApp.bgTextFieldLogin,
                  hintTextColor: ColorsApp.primaryTextColorLight,
                ),
                SizedBox(height: 10.0),
                MaterialButton(
                    color: ColorsApp.primaryColor,
                    child: Text(
                      "Suivant",
                      style: TextStyle(color: ColorsApp.primaryTextColorLight),
                    ),
                    onPressed: () {
                      if (passController.text.isEmpty ||
                          conPassController.text.isEmpty)
                        errorDialogueCard("Erreur",
                            "Remplissez tous les champs svp.", context);
                      else if (passController.text != conPassController.text)
                        errorDialogueCard(
                            "Erreur",
                            "Les deux mots de passe doivent être identique.",
                            context);
                      else if (passController.text.length < 6)
                        errorDialogueCard(
                            "Erreur",
                            "Le mot de passe doit contenir au moins 6 caractère.",
                            context);
                      else
                        pushNewPage(
                            FinishSingup(
                                nom: widget.nom,
                                prenom: widget.prenom,
                                passWord: conPassController.text),
                            context);
                    }),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(child: Divider(height: 0.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text("Avez-vous déjà un compte ?"),
                    ),
                    Expanded(child: Divider(height: 0.0)),
                  ],
                ),
                SizedBox(height: 10.0),
                MaterialButton(
                  color: Colors.blue,
                  child: Text('Se connecter',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () =>
                      pushNewPageRemoveUntil(PageSingin(), context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FinishSingup extends StatefulWidget {
  final String? nom, prenom, passWord;
  const FinishSingup({Key? key, this.nom, this.prenom, this.passWord})
      : super(key: key);

  @override
  State<FinishSingup> createState() => _FinishSingupState();
}

class _FinishSingupState extends State<FinishSingup> {
  var telephoneController = TextEditingController();
  var emailController = TextEditingController();
  var serviceApi = ServiceApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fifete',
          style: TextStyle(
            color: ColorsApp.primaryTextColorLight,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Dernière étape",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
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
                  child: 'Numéro de téléphone',
                  controller: telephoneController,
                  obscureText: false,
                  borderRadius: 0.0,
                  keyboardType: TextInputType.number,
                  backgroundColor: ColorsApp.bgTextFieldLogin,
                  hintTextColor: ColorsApp.primaryTextColorLight,
                ),
                SizedBox(height: 10.0),
                MaterialButton(
                    color: ColorsApp.primaryColor,
                    child: Text(
                      "Créer un compte",
                      style: TextStyle(color: ColorsApp.primaryTextColorLight),
                    ),
                    onPressed: () {
                      if (telephoneController.text.isEmpty ||
                          emailController.text.isEmpty)
                        errorDialogueCard(
                            "Erreur",
                            "Entrez un e-mail et un numero de téléphone svp.",
                            context);
                      else if (!serviceApi.isEmail(emailController.text))
                        errorDialogueCard(
                            "Erreur", "E-mail non valide", context);
                      else
                        serviceApi.getSingUp(
                            nom: widget.nom,
                            prenom: widget.prenom,
                            mdp: widget.passWord,
                            email: emailController.text,
                            telephone: telephoneController.text,
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
                  child: Text('Se connecter',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () =>
                      pushNewPageRemoveUntil(PageSingin(), context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
