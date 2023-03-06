


import 'package:flutter/material.dart';
import '../navigation_service/navigation_service.dart';
import '../navigation_service/route_constants.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text("Page 2"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          NavigationService().push(RouteConstants.page3);
        }, child: Text("Move To Page3")),
      ),
    );
  }
}
