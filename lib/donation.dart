import 'package:flutter/material.dart';
import 'screen/info_scren.dart';
class Donation extends StatefulWidget {
  static const String id = 'Donation';
  @override
  _Donation createState() => _Donation();
}

class _Donation extends State<Donation> {

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
          title: const Text('Donate'),
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
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Text('Donation Details',
                style: TextStyle(
                  fontSize: 56,
                ),),
              )
            ),
          ),
        ),
        ),

    );
  }
}