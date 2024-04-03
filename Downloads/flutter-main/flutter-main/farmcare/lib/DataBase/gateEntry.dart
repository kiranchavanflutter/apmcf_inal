import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GateEntryDataBase {
  int traderId;
  String traderName;
  String farmerName;
  String productName;
  String vehicleNumber;
  String vehicleType;

  GateEntryDataBase({
    required this.farmerName,
    required this.productName,
    required this.traderId,
    required this.traderName,
    required this.vehicleNumber,
    required this.vehicleType,
  });

  Map<String, dynamic> gateEntryMap() {
    return {
      'TraderID': traderId,
      'FarmerName': farmerName,
      'TraderName': traderName,
      'ProductName': productName,
      'VehicleNumber': vehicleNumber,
      'VehicleType': vehicleType,
    };
  }

  @override
  String toString() {
    return '''{
      raderID:$traderId,
      FarmerName:$farmerName,
      TraderName: $traderName,
      ProductName:$productName,
      VehicleNumber:$vehicleNumber,
      VehicleType:$vehicleType,
     
      }''';
  }
}

Future<void> insertData(GateEntryDataBase card) async {
  final localDB = await gateentrydatabase;
  await localDB.insert(
    'gateEntryTable',
    card.gateEntryMap(),
    //conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

dynamic gateentrydatabase;

dynamic gateEntryDatabaseFunction() async {
  gateentrydatabase = await openDatabase(
    join(await getDatabasesPath(), "GateEntryData4.db"),
    version: 1,
    onCreate: (db, version) {
      return db.execute('''CREATE TABLE gateEntryTable(
        traderId INTEGER,
        traderName TEXT,
        farmerName TEXT,
        productName TEXT,
        vehicleNumber TEXT,
        vehicleType TEXT,
        reason TEXT)''');
    },
  );
}
