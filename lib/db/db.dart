import 'package:fifete/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? db;
Future<void> initDatabase({String? dbName}) async {
  var path = await getDatabasePath('$dbName.db');
  db = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    var userTable = """
        CREATE TABLE utilisateur(
        idUtilisateur INT(255) NOT NULL,
        nomUtilisateur VARCHAR(250) NOT NULL,
        prenomUtilisateur VARCHAR(250) NOT NULL,
        telephoneUtilisateur VARCHAR(250) NOT NULL,
        emailUtilisateur VARCHAR(250) NOT NULL,
        gradeUtilisateur VARCHAR(50) NOT NULL,
        session VARCHAR(50) NOT NULL,
        PRIMARY KEY(idUtilisateur))
        """;
    var actualityTable = """
        CREATE TABLE actualite(
        idActualite INT(255) NOT NULL,
        sourceActualite VARCHAR(255) NOT NULL,
        titreActualite VARCHAR(250) NOT NULL,
        heureActualite DATE NOT NULL,
        imagesActualite VARCHAR(250) NOT NULL,
        idContenus VARCHAR(250) NOT NULL,
        PRIMARY KEY(idActualite))
        """;
    var canalTable = """
        CREATE TABLE canal(
        idCanal INT(255) NOT NULL,
        nomCanal VARCHAR(250) NOT NULL,
        imageCanal VARCHAR(255),
        lienCanal VARCHAR(255) NOT NULL,
        typeCanal VARCHAR(250) NOT NULL,
        idUtilisateur VARCHAR(250) NOT NULL,
        PRIMARY KEY(idCanal))
        """;
    await db.execute(userTable);
    print("Talbe user creer");
    await db.execute(actualityTable);
    print("Talbe actualité creer");
    await db.execute(canalTable);
    print("Talbe canalTable creer");
  });
}

Future<String> getDatabasePath(String dbName) async {
  var dataPath = await getDatabasesPath();
  var path = join(dataPath, dbName);
  return path;
}

Future<int?> saveUserModels({UserModels? user}) async {
  int res = await db!.insert(
    "utilisateur",
    user!.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return res;
}

Future<List?> getUserData() async {
  var result = await db!.rawQuery("SELECT * FROM utilisateur");
  return result.toList();
}

update(UserModels? userModels) async {
  var result = await db!.update("utilisateur", userModels!.toMap(),
      where: "idUtilisateur = ?", whereArgs: [userModels.idUtilisateur!]);
  return result;
}

deleteUserAccount(String? idUtilisateur) async {
  var result =
      await db!.delete("utilisateur", where: "idUtilisateur = $idUtilisateur");
  return result;
}

// Suppression complet*
Future<int> deleteAccount() async {
  print("deconnexio");
  return await db!.delete("utilisateur");
}

//Canal
Future<int?> saveCanalModels({CanalModels? canal}) async {
  int res = await db!.insert(
    "canal",
    canal!.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return res;
}

// Recuperation des informations d'un canal
Future<List?> getCanalData() async {
  var result = await db!.rawQuery("SELECT * FROM canal");
  return result.toList();
}

Future<int?> saveActuality({ActualityModels? actuality}) async {
  int res = await db!.insert(
    "actualite",
    actuality!.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return res;
}

Future<int> deleteCanal() async {
  return await db!.delete("canal");
}

// Comptage
Future<int?> getCount() async {
  return Sqflite.firstIntValue(
      await db!.rawQuery("SELECT COUNT(*) FROM numeros"));
}
