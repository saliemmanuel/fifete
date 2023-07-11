import 'dart:async';
import 'dart:convert';
import 'package:fifete/api/api.dart';
import 'package:fifete/db/db.dart';
import 'package:fifete/models/models.dart';
import 'package:fifete/utils/library/library.dart';
import 'package:fifete/views/widgets/widget.dart';
import 'package:fifete/views/wiews.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  var host = Host();
  bool isEmail(String email) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  // inscription
  getSingUp(
      {String? nom,
      String? prenom,
      String? mdp,
      String? email,
      String? telephone,
      var context}) async {
    try {
      simpleDialogueCardSansTitle("Création en cour ...", context);
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'inscription',
        'nom_utilisateur': nom,
        'prenom_utilisateur': prenom,
        "mdp_utilisateur": mdp,
        'telephone_utilisateur': telephone,
        "email_utilisateur": email,
        "grade_utilisateur": 'internaute'
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          getSingIn(email: email, mdp: mdp, context: context);
        } else {
          Navigator.pop(context);
          errorDialogueCard("Erreur !", "${response['message']}", context);
        }
      }
    } catch (e) {
      errorDialogueCard("Erreur !", "$e", context)
          .then((value) => Navigator.pop(context));
    }
  }

  // connexion
  getSingIn({String? email, String? mdp, var context}) async {
    try {
      simpleDialogueCardSansTitle("Connexion en cour ...", context);
      var pref;
      UserModels userModels;
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'connexion',
        "email_utilisateur": email,
        "mdp_utilisateur": mdp
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          pref = await SharedPreferences.getInstance();
          // Enregistrement des insformation de l'utilisateur dans sqflite
          pref.setString('session', "${response['session']}");
          userModels = UserModels(
              idUtilisateur: response['id_utilisateur'],
              nomUtilisateur: response['nom_utilisateur'],
              prenomUtilisateur: response['prenom_utilisateur'],
              telephoneUtilisateur: response['telephone_utilisateur'],
              emailUtilisateur: response['email_utilisateur'],
              gradeUtilisateur: response['grade_utilisateur'],
              session: response['session']);
          await saveUserModels(user: userModels);
          // Enregistrement  insformation canal dans sqflite
          var getcanalData = await getCanalData(
              idUtilisateur: userModels.idUtilisateur,
              gradeUtilisateur: userModels.gradeUtilisateur);
          print(getcanalData);
          if (getcanalData != null) {
            if (getcanalData.isNotEmpty) {
              print(getcanalData[0]['lien_canal']);
              await saveCanalModels(
                  canal: CanalModels(
                idCanal: getcanalData[0]['id_canal'],
                lienCanal: getcanalData[0]['lien_canal'],
                nomCanal: getcanalData[0]['nom_canal'],
                typeCanal: getcanalData[0]['type_canal'],
                imageCanal: getcanalData[0]['image_canal'],
                idUtilisateur: getcanalData[0]['id_utilisateur'],
              ));
            }
          }
          pushNewPageRemoveUntil(
              PageAcceuil(initialIndex: 0, user: userModels, sharedText: null),
              context);
        } else {
          Navigator.pop(context);
          errorDialogueCard("Erreur !", "${response['message']}", context);
        }
      }
    } catch (e) {
      errorDialogueCard("Erreur !", "$e", context)
          .then((value) => Navigator.pop(context));
    }
  }

// deconnexion
  getLogOut(
      {required String? email, required String? idUti, var context}) async {
    try {
      simpleDialogueCardSansTitle("Déconnexion en cour ...", context);
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'deconnexion',
        "email_utilisateur": email,
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });

      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          print(idUti);
          await deleteUserAccount(idUti);
          await deleteCanal();
          pushNewPageRemoveUntil(PageSingin(), context);
        } else {
          Navigator.pop(context);
          errorDialogueCard("Déconnexion", "${response['message']}", context);
        }
      }
    } catch (e) {
      errorDialogueCard("Erreur !", "$e", context)
          .then((value) => Navigator.pop(context));
    }
  }

  // canal
  createCanal(String? nomCanal, String? gradeUtilisateur, String? idUtilisateur,
      var typeCanal, var page, var context) async {
    try {
      simpleDialogueCardSansTitle("Création en cour ...", context);
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'creerCanal',
        'nom_canal': nomCanal,
        'grade_utilisateur': gradeUtilisateur,
        'id_utilisateur': idUtilisateur,
        'type_canal': typeCanal
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          var getcanalData = await getCanalData(
              idUtilisateur: idUtilisateur, gradeUtilisateur: gradeUtilisateur);
          if (getcanalData != null) {
            print(getcanalData[0]['lien_canal']);
            saveCanalModels(
                canal: CanalModels(
              idCanal: getcanalData[0]['id_canal'],
              lienCanal: getcanalData[0]['lien_canal'],
              nomCanal: getcanalData[0]['nom_canal'],
              typeCanal: getcanalData[0]['type_canal'],
              imageCanal: getcanalData[0]['image_canal'],
              idUtilisateur: getcanalData[0]['id_utilisateur'],
            ));
            Navigator.pop(context);
            pushNewPageRemoveUntil(page, context);
          }
        } else {
          errorDialogueCard("Erreur !", response['message'], context)
              .then((value) => Navigator.pop(context));
        }
      }
    } catch (e) {
      var data = e.toString().split(":");
      print(data.toList()[1]);
      errorDialogueCard("Erreur !", "${data.toList()[1].trim()}", context);
    }
  }

  // info-canal
  getCanalData({var idUtilisateur, var gradeUtilisateur}) async {
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'info-canal',
        'id_utilisateur': idUtilisateur
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        print(response);

        if (response['error'] == '0') {
          return response['canal'];
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // publier
  publishActuality(
      {String? idUtilisateur,
      String? gradeUtilisateur,
      String? titreActualite,
      String? typeActualite,
      String? descriptionActualite,
      List? listImage,
      Function()? callBack,
      var context}) async {
    simpleDialogueCardSansTitle("Publication en cour ...", context);

    try {
      var request = new http.MultipartRequest("POST", host.baseUrl());

      request.fields['key'] = 'fifete';
      request.fields['service'] = 'publier';
      request.fields['id_utilisateur'] = idUtilisateur!;
      request.fields['grade_utilisateur'] = gradeUtilisateur!;
      request.fields['titre_actualite'] = titreActualite!;
      request.fields['type_actualite'] = typeActualite!;
      request.fields['description_actualite'] = descriptionActualite!;

      for (var i = 0; i < listImage!.length; i++) {
        print(listImage[i].path);
        var multipart = await http.MultipartFile.fromPath(
            "fileImage[$i]", listImage[i].path);
        request.files.add(multipart);
      }

      await request.send().then((response) {
        if (response.statusCode == 200) {
          Navigator.pop(context);
          response.stream.transform(utf8.decoder).listen((value) {
            if (value.contains("Successfully")) {
              errorDialogueCard("Publication", "Effectuée", context);
              callBack;
            } else
              errorDialogueCard("Publication", "Echec de publication", context);
          });
        }
      });
    } catch (e) {
      var data = e.toString().split(":");
      print(data.toList()[1]);
      errorDialogueCard("Erreur !", "${data.toList()[1].trim()}", context);
    }
  }

  // tous-actualite
  getAllActuality(var context) async {
    List listActualite = [];
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'tous-actualite',
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          response['actualite'].forEach((element) {
            listActualite.add(element);
          });
          return listActualite;
        }
      }
    } catch (e) {
      var data = e.toString().split(":");
      print(data.toList()[1]);
      errorDialogueCard("Erreur !", "${data.toList()[1].trim()}", context);
    }
  }

//tous-video
  getAllVideo(var context) async {
    List listVideo = [];

    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'tous-video',
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          response['video'].forEach((element) {
            listVideo.add(element);
          });
          return listVideo;
        }
      }
    } catch (e) {
      var data = e.toString().split(":");
      print(data.toList()[1]);
      errorDialogueCard("Erreur !", "${data.toList()[1].trim()}", context);
    }
  }

  // notification
  getAllNotification(var context) async {
    List listNotifications = [];

    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'notifications',
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          response['notification'].forEach((element) {
            listNotifications.add(element);
          });
          return listNotifications;
        }
      }
    } catch (e) {
      var data = e.toString().split(":");
      print(data.toList()[1]);
      errorDialogueCard("Erreur !", "${data.toList()[1].trim()}", context);
    }
  }

// ajout-favoris
  addFavoris({var idUtilisateur, var idActualite, var context}) async {
    try {
      simpleDialogueCardSansTitle("Ajout en cour ...", context);
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'ajout-favoris',
        "id_utilisateur": idUtilisateur,
        "id_actualite": idActualite
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          Navigator.pop(context);
          Alert(message: 'Ajout effectué.').show();
        }
      }
    } catch (e) {
      Navigator.pop(context);
      Alert(message: 'Déjà dans vos favoris.').show();
    }
  }

  // list-favoris
  getFavoris(var idUtilisateur, var context) async {
    List listFavoris = [];

    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'list-favoris',
        "id_utilisateur": idUtilisateur
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          response['favoris'].forEach((element) {
            listFavoris.add(element);
          });
          return listFavoris;
        }
        if (response['error'] == '1') {
          Alert(message: 'Vous avez ajouter aucun favoris.').show();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // supprimer-favoris
  deleteFavoris(var idFavoris, var context) async {
    try {
      simpleDialogueCardSansTitle("Suppréssion en cour ...", context);
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'supprimer-favoris',
        "id_favoris": idFavoris
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          Navigator.pop(context);
          Alert(message: 'Suppression effectuée.').show();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // Formatage heure
  formatDate(String date) {
    DateTime? datemsg;
    var annee = int.parse(date.substring(0, 4));
    var mois = int.parse(date.substring(5, 7));
    var jour = int.parse(date.substring(8, 10));
    var heur = int.parse(date.substring(11, 13));
    var min = int.parse(date.substring(14, 16));
    var sec = int.parse(date.substring(17, 19));
    datemsg = DateTime(annee, mois, jour, heur, min, sec);
    var datenow = DateTime.now();
    var different = datenow.difference(datemsg);
    if (different.inDays > 8) {
      return 'Le $jour/$mois/$annee a $heur h $min min';
    } else if ((different.inDays / 7).floor() >= 1) {
      return "1 semaine";
    } else if (different.inDays >= 2) {
      return '${different.inDays} jours';
    } else if (different.inDays >= 1) {
      return 'hier';
    } else if (different.inHours >= 2) {
      return 'il y\'a  ${different.inHours} heurs';
    } else if (different.inHours >= 1) {
      return 'il y\' a 1 heur';
    } else if (different.inMinutes >= 2) {
      return 'il y\'a  ${different.inMinutes} min';
    } else if (different.inMinutes >= 1) {
      return 'il y\'a 1 min';
    } else if (different.inSeconds >= 3) {
      return 'il y\'a  ${different.inSeconds} sec';
    } else {
      return 'Maintenant';
    }
  }

  // Liker un actualite
  likeActuality({String? idUtilisateur, String? idActualite}) async {
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'getInsertLike',
        "id_utilisateur": idUtilisateur,
        "id_actualite": idActualite
      });

      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);

        if (response['error'] == '0') {
          return true;
        }
        if (response['error'] == '1') {
          return false;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // Dis Liker un actualite
  getDeleteLike({String? idUtilisateur, String? idActualite}) async {
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'getDeleteLike',
        "id_utilisateur": idUtilisateur,
        "id_actualite": idActualite
      });

      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        print(response);
        if (response['error'] == '0') {
          return false;
        }
        if (response['error'] == '1') {
          return true;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  commentActuality(
      {String? nomUtilisateur,
      String? contenusCommentaire,
      String? idCommentaire_1,
      String? idUtilisateur,
      String? idActualite,
      var context}) async {
    simpleDialogueCardSansTitle("Ajout en cour ...", context);
    var data = await http.post(host.baseUrl(), body: {
      "key": 'fifete',
      'service': 'insert-comment',
      "nom_utilisateur": nomUtilisateur,
      "contenus_commentaire": contenusCommentaire,
      "id_commentaire_1": idCommentaire_1 == null ? "" : idCommentaire_1,
      "id_utilisateur": idUtilisateur,
      "id_actualite": idActualite,
    }).timeout(Duration(seconds: 10), onTimeout: () {
      throw TimeoutException(
          'Connexion perdue, verifier votre connexion internet');
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      print(response);
      if (response['error'] == '0') {
        Navigator.pop(context);
        Alert(message: response['message']).show();
      }
    }
  }

  getAllcommentActualityById({String? idActualite, var context}) async {
    List listCommentaire = [];

    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'commentaire-actualite',
        "id_actualite": idActualite
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          response['commentaire'].forEach((element) {
            listCommentaire.add(element);
          });
          return listCommentaire.isEmpty ? null : listCommentaire;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // Liker un actualite
  shareActuality({String? idUtilisateur, String? idActualite}) async {
    print("sahre");
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'insertShare',
        "id_utilisateur": idUtilisateur,
        "id_actualite": idActualite
      });

      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        print(response);
        if (response['error'] == '0') {
          return true;
        }
        if (response['error'] == '1') {
          return false;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  detectIfUserLikeCommentAndShare(
      {String? idUtilisateur, String? idActualite}) async {
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'detectIfUserLikeCommentAndShare',
        "id_utilisateur": idUtilisateur,
        "id_actualite": idActualite
      });

      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          return response;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // List images d'un actualite
  getListImageActuality({String? idActualite}) async {
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'list-images',
        "id_actualite": idActualite
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          return response['images'];
        }
        if (response['error'] == '1') {
          print("Error aucune image");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // information sur une actualite specifique
  getSingleActuality({String? idActualite}) async {
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'getSingleActuality',
        "id_actualite": idActualite
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          return response['data'][0];
        }
        if (response['error'] == '1') {
          print("Error aucune data");
        }
      }
    } catch (e) {
      print(e);
    }
  }

// Recuperer tout les actualités
  getActualityBySingleAdmin({String? idCanal}) async {
    try {
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'getActualityBySingleAdmin',
        "id_canal": idCanal
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          return response['data'];
        }
        if (response['error'] == '1') {
          print("Error aucune data");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // Mise modification description actualité
  updateActualite(
      {required String? newDescription,
      required String? idActualite,
      required var page,
      required var context}) async {
    try {
      simpleDialogueCardSansTitle("Ajout en cour ...", context);
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'updateActualite',
        "new_description": newDescription,
        "id_actualite": idActualite
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        print(response);
        if (response['error'] == '0') {
          pushNewPage(page, context);
          Alert(message: 'Effectué').show();
        }
        if (response['error'] == '1') {
          print("Error aucune data");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //  Suppression d'une actualite

  deleteActualite({var idActualite, var idCanal, var context}) async {
    try {
      simpleDialogueCardSansTitle("Suppréssion en cour ...", context);
      var data = await http.post(host.baseUrl(), body: {
        "key": 'fifete',
        'service': 'deleteActualite',
        "id_actualite": idActualite,
        "id_canal": idCanal
      }).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Connexion perdue, verifier votre connexion internet');
      });
      if (data.statusCode == 200) {
        var response = jsonDecode(data.body);
        if (response['error'] == '0') {
          Navigator.pop(context);
          Alert(message: 'Suppression effectuée.').show();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
