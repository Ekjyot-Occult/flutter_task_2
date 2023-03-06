import 'package:flutter/material.dart';
import '../navigation_service/navigation_service.dart';
import '../navigation_service/route_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nested Navigations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              NavigationService().push(RouteConstants.page1);
            }, child: Text("Move To Page1")),
            ElevatedButton(onPressed: () {
              NavigationService().push(RouteConstants.page2);
            }, child: Text("Move To Page2")),
            ElevatedButton(onPressed: () {
              NavigationService().push(RouteConstants.page3);
            }, child: Text("Move To Page3")),
            ElevatedButton(onPressed: () {
              NavigationService().push(RouteConstants.page4);
            }, child: Text("Move To Page4")),  ElevatedButton(onPressed: () {
              NavigationService().push(RouteConstants.page5);
            }, child: Text("Move To Page5")),
          ],
        ),
      ),
    );
  }
}
