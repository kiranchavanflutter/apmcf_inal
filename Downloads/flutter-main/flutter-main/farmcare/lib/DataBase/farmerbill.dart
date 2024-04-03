import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FarmerBillDataBase {
  int? farmerNo;
  String farmerName;
  String date;
  String place;
  String traderName;
  num totalBill;
  num expenses;
  String product;
  String quantity;
  num rate;
  FarmerBillDataBase(
      {required this.date,
      required this.expenses,
      required this.farmerName,
      required this.place,
      required this.totalBill,
      required this.traderName,
      required this.product,
      required this.quantity,
      required this.rate});

  Map<String, dynamic> farmerbillMap() {
    return {
      'FarmerName': farmerName,
      'Product': product,
      'Rate': rate,
      'Quantity': quantity,
      'Date': date,
      'Place': place,
      'Totalbill': totalBill,
      'Expences': expenses,
      'TraderName': traderName,
    };
  }

  @override
  String toString() {
    return '''{
      FarmereName:$farmerName, 
      Product:$product,
      Rate:$rate,
      Quantity:$quantity
      BidPrice:$date,
      Place:$place,
      Bill:$totalBill,
      expenses:$expenses,
      TraderName:$traderName
      }''';
  }
}

Future<void> insertData(FarmerBillDataBase card) async {
  final localDB = await biddingdatabase;
  await localDB.insert(
    'farmerbillTable',
    card.farmerbillMap(),
    //conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<FarmerBillDataBase>> getData() async {
  final localDB = await biddingdatabase;
  List<Map<String, dynamic>> mapEntry = await localDB.query("farmerbillTable");

  return List.generate(mapEntry.length, (i) {
    return FarmerBillDataBase(
      date: mapEntry[i]['date'],
      expenses: mapEntry[i]['expenses'] ?? 0.0,
      farmerName: mapEntry[i]['farmerName'],
      place: mapEntry[i]['place'],
      totalBill: mapEntry[i]['totalBill'] ?? 0.0,
      traderName: mapEntry[i]['traderName'],
      product: mapEntry[i]['product'],
      rate: mapEntry[i]['rate'],
      quantity: mapEntry[i]['quantity'],
    );
  });
}

dynamic biddingdatabase;

dynamic farmerBillDatabaseFunction() async {
  biddingdatabase = await openDatabase(
    join(await getDatabasesPath(), "FarmerBillData7.db"),
    version: 1,
    onCreate: (db, version) {
      return db.execute('''CREATE TABLE farmerbillTable(
        farmerName TEXT,
        product TEXT,
        quantity TEXT,
        rate REAL,
        expences REAL,
        traderName TEXT,
        date TEXT,
        place TEXT,
        totalBill REAL)''');
    },
  );
}
