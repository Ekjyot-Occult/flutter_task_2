





import 'package:flutter/material.dart';
import '../navigation_service/navigation_service.dart';
import '../navigation_service/route_constants.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text("Page 4"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          NavigationService().push(RouteConstants.page5);
        }, child: Text("Move To Page5")),
      ),
    );
  }
}
