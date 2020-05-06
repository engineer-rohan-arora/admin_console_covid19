import 'package:flutter/material.dart';
import 'screen/info_scren.dart';
class ReportMass extends StatefulWidget {
  static const String id = 'ReportMass';
  @override
  _ReportMass createState() => _ReportMass();
}

class _ReportMass extends State<ReportMass> {

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
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),

          ),
          title: const Text('Mass Gathering Report'),
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GatheringList(address: 'Kishanpura',reporter: 'Rohan',contact:'95454'),
                    GatheringList(address: 'Kishanpura',reporter: 'Rohan',contact:'95454'),
                    GatheringList(address: 'Kishanpura',reporter: 'Rohan',contact:'95454'),

                  ],
                ),
              ),
            ),
          ),
        ),
        ),

    );
  }
}

class GatheringList extends StatelessWidget {

  GatheringList({this.address,this.contact,this.reporter});

  final String address;
  final String contact;
  final String reporter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Material(
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            elevation: 5.0,
            color: Colors.white  ,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

              child: Column(
                children: <Widget>[
                  Text('Location: $address',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),

                  SizedBox(height: 15,),

                  Text('Reported By : $reporter', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),),
                  SizedBox(height: 15,),

                  Text('Contact : $contact', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),),


                ],
              ),
              //,
            ),
          ),

        ],
      ),
    );
  }
}