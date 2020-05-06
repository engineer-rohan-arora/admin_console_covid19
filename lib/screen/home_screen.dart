import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widget/my_header.dart';
import 'package:admincovid/constant.dart';
import 'package:admincovid/screen/info_scren.dart';
import 'package:admincovid/report_patient.dart';
import 'package:admincovid/hotspot_list.dart';
import 'package:admincovid/report_mass.dart';
import 'package:admincovid/volunteer_regen.dart';
import 'package:admincovid/updt_doc.dart';
import 'package:admincovid/updt_drop.dart';
import 'package:admincovid/updt_ngo.dart';
import 'package:admincovid/updt_food.dart';
import 'package:admincovid/updt_news.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Covid Help'),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.pushNamed(context, Info.id);
              },
            ),
            // action button
            // overflow menu
          ],
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              MyHeader(
                image: "assets/icons/Drcorona.svg",
                textTop: "Admin",
                textBottom: "Saharanpur Covid APP",
                offset: offset,
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Counter Update', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'No. of cases'
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Recovered'
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Deceased'
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () {},
                        child: Text('Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Make an Announcement', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title'
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descreption'
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () {},
                        child: Text('Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Text('SAHARANPUR',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text('Covid-19 Help',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Mass Gathering Report'),
                onTap: () {
                  Navigator.pushNamed(context, ReportMass.id);
                },
              ),
              ListTile(
                title: Text('Reported Patients'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushNamed(context, ReportPatient.id);
                },
              ),
              ListTile(
                title: Text('Registered Volunteers'),
                onTap: () {Navigator.pushNamed(context, Volunteer.id);},
              ),
              ListTile(
                title: Text('Update Hotspot List'),
                onTap: () {
                  Navigator.pushNamed(context, HotSpot.id);
                },
              ),
              ListTile(
                title: Text('Update News'),
                onTap: () {
                  Navigator.pushNamed(context, UpdtNews.id);
                },
              ),
              ListTile(
                title: Text('Update Food Distribution'),
                onTap: () {
                  Navigator.pushNamed(context, UpdtFood.id);
                },
              ),
              ListTile(
                title: Text('Update Food Drop Points'),
                onTap: () {
                  Navigator.pushNamed(context, FooodDrop.id);
                },
              ),
              ListTile(
                title: Text('Add Doctor\'s contact' ),
                onTap: () {
                  Navigator.pushNamed(context, DocList.id);
                },
              ),
              ListTile(
                title: Text('Add NGO\'s contact'),
                onTap: () {
                  Navigator.pushNamed(context, NgoList.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}


