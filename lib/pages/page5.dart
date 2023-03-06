import 'package:flutter/material.dart';
import '../navigation_service/navigation_service.dart';
import '../navigation_service/route_constants.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  List pagesName = [
    "page1",
    "page2",
    "page3",
    "page4",
    "page5",
  ];

  String value = "page1";
  late List<DropdownMenuItem> list;

  @override
  void initState() {
    list = pagesName
        .map((e) => DropdownMenuItem(
              child: Text(e.toString().toUpperCase()),
              value: e,
            ))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Page 5"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  NavigationService().popUntil(RouteConstants.myHomePage, context);
                },
                child: Text("Move To HomePage"),
              ),
              DropdownButton(
                hint: Text("Select a Page"),
                value: value,
                items: list,
                onChanged: (page) {
                  setState(() {
                    value = page;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  switch ("/${value!}") {
                    case RouteConstants.page1:
                      NavigationService().popUntil(RouteConstants.page1, context);
                      break;
                    case RouteConstants.page2:
                      NavigationService().popUntil(RouteConstants.page2, context);
                      break;
                    case RouteConstants.page3:
                      NavigationService().popUntil(RouteConstants.page3, context);
                      break;
                    case RouteConstants.page4:
                      NavigationService().popUntil(RouteConstants.page4, context);
                      break;
                    case RouteConstants.page5:
                      NavigationService().popUntil(RouteConstants.page5, context);
                      break;
                  }
                },
                child: Text("Move To Selected Page"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
