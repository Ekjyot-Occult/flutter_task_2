


import 'package:flutter/material.dart';
import '../navigation_service/navigation_service.dart';
import '../navigation_service/route_constants.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Page 1"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          NavigationService().push(RouteConstants.page2);
        }, child: Text("Move To Page2")),
      ),
    );
  }
}
