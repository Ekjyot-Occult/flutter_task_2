import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'route_service.dart';

class NavigationService {
  static final NavigationService _singleton = NavigationService._internal();

  factory NavigationService() => _singleton;

  NavigationService._internal();

  GlobalKey<NavigatorState> navigationKey = GlobalKey();
  List navigationStack = ["/"];
  int count = 0;

  customAnimation(String pageName) {
    PageRouteBuilder pageRouteBuilder(var transitionBuilder) {
      return PageRouteBuilder(
        settings: RouteSettings(name: pageName),
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, primary, secondary) => RouteService.routes[pageName]!,
        transitionsBuilder: transitionBuilder,
      );
    }

    List<PageRouteBuilder> pageRouteAnimations = [
      pageRouteBuilder(
        (_, primary, secondary, child) {
          final tween = Tween<double>(begin: 0.1, end: 1).animate(
            CurvedAnimation(
              parent: primary,
              curve: Curves.linear,
            ),
          );
          return Opacity(
            opacity: tween.value,
            child: child,
          );
        },
      ),
      pageRouteBuilder(
        (_, primary, secondary, child) {
          final tween =
              Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
            CurvedAnimation(
              parent: primary,
              curve: Curves.easeInOutBack,
            ),
          );

          return SlideTransition(
            position: tween,
            child: child,
          );
        },
      ),
      pageRouteBuilder(
        (_, primary, secondary, child) {
          final tween = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: primary,
              curve: Curves.easeInOutBack,
            ),
          );

          return ScaleTransition(
            scale: tween,
            child: child,
          );
        },
      ),
      pageRouteBuilder(
        (_, primary, secondary, child) {
          final tween = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: primary,
              curve: Curves.bounceIn,
            ),
          );

          final secondaryTween =
              Tween<Offset>(begin: Offset(0.5, 0), end: Offset.zero).animate(
            CurvedAnimation(
              parent: primary,
              curve: Curves.bounceIn,
            ),
          );

          return SlideTransition(
            position: secondaryTween,
            child: ScaleTransition(
              scale: tween,
              child: child,
            ),
          );
        },
      ),
      pageRouteBuilder(
        (_, primary, secondary, child) {
          final tween = Tween<double>(begin: 1, end: 0).animate(
            CurvedAnimation(
              parent: primary,
              curve: Curves.bounceIn,
            ),
          );

          final SecondaryTween = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: primary,
              curve: Curves.linear,
            ),
          );

          return ScaleTransition(
            scale: SecondaryTween,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(tween.value * 200),
              child: child,
            ),
          );
        },
      ),
    ];
    count < 4 ? count++ : count = 0;
    return pageRouteAnimations[count];
  }

  popUntil(String pageName, BuildContext context) {
    showScaffold(String string) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(string),
          duration: const Duration(seconds: 1),
        ),
      );
    }

    navigationKey.currentState!.popUntil(
      (route) {
        if (route.isFirst ||
            route.settings.name == pageName ||
            !navigationStack.contains(pageName)) {
          if (!navigationStack.contains(pageName)) {
            showScaffold("Page Doesn't Exist in Stack");
          }
          if (pageName == navigationStack.last) {
            showScaffold("You are in the same page");
          }
          return true; //not remove
        } else {
          return false;
        }
      },
    );
  }

  push(String pageName) {
    navigationStack.add(pageName);
    print(navigationStack);
    navigationKey.currentState
        ?.push(
      customAnimation(pageName),
    )
        .then((value) {
      navigationStack.removeLast();
      print(navigationStack);
    });
  }
}
