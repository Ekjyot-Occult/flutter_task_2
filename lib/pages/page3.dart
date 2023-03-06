





import 'package:flutter/material.dart';
import '../navigation_service/navigation_service.dart';
import '../navigation_service/route_constants.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("Page 3"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          NavigationService().push(RouteConstants.page4);
        }, child: Text("Move To Page4")),
      ),
    );
  }
}
