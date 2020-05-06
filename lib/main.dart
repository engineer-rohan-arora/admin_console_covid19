import 'package:flutter/material.dart';
import 'package:admincovid/volunteer_regen.dart';
import 'screen/home_screen.dart';
import 'screen/info_scren.dart';
import 'report_mass.dart';
import 'report_patient.dart';
import 'hotspot_list.dart';
import 'donation.dart';
import 'updt_doc.dart';
import 'updt_drop.dart';
import 'updt_ngo.dart';
import 'updt_food.dart';
import 'updt_news.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          Info.id: (context) => Info(),
          Volunteer.id: (context) => Volunteer(),
          ReportMass.id : (context) => ReportMass(),
          ReportPatient.id : (context) => ReportPatient(),
          HotSpot.id : (context) => HotSpot(),
          Donation.id : (context) => Donation(),
          UpdtFood.id : (context)=> UpdtFood(),
          DocList.id: (context) => DocList(),
          UpdtNews.id:(context) => UpdtNews(),
          NgoList.id: (context) => NgoList(),
          FooodDrop.id: (context) => FooodDrop(),
        },
        home: HomeScreen());
  }
}