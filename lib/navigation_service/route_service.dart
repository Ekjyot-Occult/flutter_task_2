



import 'package:flutter/cupertino.dart';

import 'route_constants.dart';
import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import '../pages/page5.dart';
import '../pages/my_home_page.dart';

class RouteService{

  static Map<String, Widget> routes = {
    RouteConstants.myHomePage : MyHomePage(),
    RouteConstants.page1 : Page1(),
    RouteConstants.page2 : Page2(),
    RouteConstants.page3 : Page3(),
    RouteConstants.page4 : Page4(),
    RouteConstants.page5 : Page5(),

  };

}