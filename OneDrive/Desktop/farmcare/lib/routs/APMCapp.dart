import 'package:farmcare/Farmer/Bill.dart';
import 'package:farmcare/Farmer/FarmerGateEntryPage.dart';
import 'package:farmcare/Farmer/LogoutPage.dart';
import 'package:farmcare/Farmer/LotHistoryPage.dart';
import 'package:farmcare/Farmer/LotPage.dart';
import 'package:farmcare/Farmer/LotStatusPage.dart';
import 'package:farmcare/Traders/BidHistoryPage.dart';
import 'package:farmcare/Traders/BillGeneratePage.dart';
import 'package:farmcare/Traders/GateEntryPage.dart';
import 'package:farmcare/Traders/WinnersPage.dart';
import 'package:flutter/material.dart';
import 'package:farmcare/Home/HomePage.dart';
import 'package:farmcare/Home/AboutAPMCPage.dart';
import 'package:farmcare/Home/ContactUsPage.dart';
import 'package:farmcare/Home/FarmerPage.dart';
import 'package:farmcare/Home/LatestNewsPage.dart';
import 'package:farmcare/Home/LiveMarketPage.dart';
import 'package:farmcare/Home/TraderPage.dart';
import 'package:farmcare/Home/WeatherPage.dart';
import 'package:farmcare/Traders/BiddingPage.dart';

class APMCApp extends StatelessWidget {
  const APMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APMC System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/liveMarket': (context) => LiveMarketPage(),
        '/aboutAPMC': (context) => const AboutAPMCPage(),
        '/weather': (context) => const WeatherPage(),
        '/latestNews': (context) => LatestNewsPage(),
        '/trader': (context) => TraderPage(),
        '/farmer': (context) => const FarmerPage(),
        '/contactUs': (context) => ContactUsPage(),
        '/trader/bidding': (context) => const BiddingPage(),
        '/trader/winners': (context) => WinnersPage(),
        '/trader/bidHistory': (context) => BidHistoryPage(),
        '/trader/billGenerate': (context) => BillGeneratePage(),
        '/trader/gateEntry': (context) => GateEntryPage(),
        '/farmer/lot': (context) => LotPage(),
        '/farmer/lotStatus': (context) => LotStatusPage(),
        '/farmer/lotHistory': (context) => LotHistoryPage(),
        '/farmer/bills': (context) => BillsPage(),
        '/farmer/gateEntry': (context) => FarmerGateEntryPage(),
        '/farmer/login': (context) => LoginPage(),
      },
    );
  }
}
