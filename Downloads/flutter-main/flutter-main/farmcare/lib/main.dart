import 'package:farmcare/DataBase/biddingdata.dart';
import 'package:farmcare/DataBase/farmerbill.dart';
import 'package:farmcare/DataBase/gateEntry.dart';
import 'package:farmcare/LoginPage/loginData.dart';
import 'package:flutter/material.dart';
import 'routs/APMCapp.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  loginDatabaseFunction();
  gateEntryDatabaseFunction();
  farmerBillDatabaseFunction();
  biddingDatabaseFunction();
  runApp(const APMCApp());
}
