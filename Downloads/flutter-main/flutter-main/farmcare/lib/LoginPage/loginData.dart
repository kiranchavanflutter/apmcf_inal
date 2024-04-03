import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LoginDataBase {
  String name;
  String userName;
  String email;
  String password;
  LoginDataBase({
    required this.email,
    required this.name,
    required this.password,
    required this.userName,
  });

  Map<String, dynamic> bidingMap() {
    return {
      'Name': name,
      'userName': userName,
      'passWord': password,
      'email': email,
    };
  }

  @override
  String toString() {
    return '''{
     'Name': $name,
      'userName': $userName,
      'passWord': $password,
      'email': $email,
      }''';
  }
}

Future<void> insertData(LoginDataBase card) async {
  final localDB = await logindatabase;
  await localDB.insert(
    'loginTable',
    card.bidingMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<LoginDataBase>> getData() async {
  final localDB = await logindatabase;
  List<Map<String, dynamic>> mapEntry = await localDB.query("loginTable");
  return List.generate(mapEntry.length, (i) {
    return LoginDataBase(
      email: mapEntry[i]['email'],
      name: mapEntry[i]['name'],
      password: mapEntry[i]['password'],
      userName: mapEntry[i]['userName'],
    );
  });
}

dynamic logindatabase;

dynamic loginDatabaseFunction() async {
  logindatabase = await openDatabase(
    join(await getDatabasesPath(), "LoginData107.db"),
    version: 1,
    onCreate: (db, version) {
      return db.execute('''CREATE TABLE loginTable(
        name TEXT,
        userName PRIMARY KEY,
        email TEXT,
        password TEXT)''');
    },
  );
}
