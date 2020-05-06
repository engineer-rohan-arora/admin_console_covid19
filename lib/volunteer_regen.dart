import 'package:flutter/material.dart';

class Volunteer extends StatefulWidget {
  static const String id = 'Volunteer';
  @override
  _Volunteer createState() => _Volunteer();
}

class _Volunteer extends State<Volunteer> {

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
                    VolnList(mail: 'hsdcb@fs.in',name: 'Rohan',contact:'95454'),
                    VolnList(mail: 'hsdcb@fs.in',name: 'Rohan',contact:'95454'),
                    VolnList(mail: 'hsdcb@fs.in',name: 'Rohan',contact:'95454'),

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

class VolnList extends StatelessWidget {

  VolnList({this.name,this.contact,this.mail});

  final String name;
  final String contact;
  final String mail;

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
                  Text('Name: $name',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),

                  SizedBox(height: 15,),

                  Text('E-mail address : $mail', style: TextStyle(
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