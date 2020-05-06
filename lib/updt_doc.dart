import 'package:flutter/material.dart';
import 'screen/info_scren.dart';
import 'constant.dart';
class DocList extends StatefulWidget {
  static const String id = 'DocList';
  @override
  _DocList createState() => _DocList();
}

class _DocList extends State<DocList> {

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
          title: const Text('Doctor\'s contact'),
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
        body: Container(
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
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Doctor\'s contact', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name of the Doctor'
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact'
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
      ),

    );
  }
}
class HotspotList extends StatelessWidget {

  HotspotList({this.title,this.patients});

  final String title;
  final String patients;

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
                  Text(title,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),

                  SizedBox(height: 15,),

                  Text('No. of Infected People : $patients', style: TextStyle(
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