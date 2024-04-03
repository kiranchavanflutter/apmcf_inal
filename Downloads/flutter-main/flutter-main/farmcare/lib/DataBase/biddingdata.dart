import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BiddingDataBase {
  String productName;
  int lotCode;
  String traderName;

  String startDate;
  String endDate;
  num bidPrice;

  BiddingDataBase({
    required this.productName,
    required this.bidPrice,
    required this.endDate,
    required this.lotCode,
    required this.startDate,
    required this.traderName,
  });
  Map<String, dynamic> bidingMap() {
    return {
      'ProductName': productName,
      'BidPrice': bidPrice,
      'EndDate': endDate,
      'StartDate': startDate,
      'LotCode': lotCode,
      'TraderName': traderName,
    };
  }

  @override
  String toString() {
    return '''{
      ProductName:$productName, 
      BidPrice:$bidPrice,
      StartDate:$startDate,
      EndDate:$endDate,
      LotCode:$lotCode,
      TraderName:$traderName
      }''';
  }
}

Future<void> insertData(BiddingDataBase card) async {
  final localDB = await biddingdatabase;
  await localDB.insert(
    'biddingTable',
    card.bidingMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<BiddingDataBase>> getData() async {
  final localDB = await biddingdatabase;
  List<Map<String, dynamic>> mapEntry = await localDB.query("biddingTable");

  return List.generate(mapEntry.length, (i) {
    // setState(() {});
    return BiddingDataBase(
      productName: mapEntry[i]['productName'] ?? '',
      bidPrice: mapEntry[i]['bidPrice'] ?? 0,
      endDate: mapEntry[i]['endDate'] ?? '',
      lotCode: mapEntry[i]['lotCode'] ?? 0,
      startDate: mapEntry[i]['startDate'] ?? '',
      traderName: mapEntry[i]['traderName'] ?? '',
    );
  });
}

dynamic biddingdatabase;

dynamic biddingDatabaseFunction() async {
  biddingdatabase = await openDatabase(
    join(await getDatabasesPath(), "BiddingData11.db"),
    version: 1,
    onCreate: (db, version) {
      return db.execute('''CREATE TABLE biddingTable(
        productName TEXT,
        lotCode INTEGER PRIMARY KEY AUTOINCREMENT,
        traderName TEXT,
        startdate TEXT,
        enddate TEXT,
        bidPrice REAL)''');
    },
  );
}
