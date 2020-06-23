import 'package:flutter/material.dart';
import 'package:spotguide/screens/MapScreen.dart';
import 'package:spotguide/screens/SearchScreen.dart';
import 'package:spotguide/screens/SettingsScreen.dart';

// ignore: must_be_immutable
class HomeScreenPageController extends StatefulWidget {

  HomeScreenPageControllerHandler _handler;

  HomeScreenPageController(HomeScreenPageControllerHandler handler) {
    _handler = handler;
  }

  @override
  HomeScreenPageControllerState createState() => HomeScreenPageControllerState();
}

class HomeScreenPageControllerState extends State<HomeScreenPageController> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

  @override
  Widget build(BuildContext context) {
    return buildPageController(context);
  }

  Widget buildPageController(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        widget._handler.onPageChanged(index);
      },
      children: <Widget>[
        MapScreen(),
        SearchScreen(),
        SettingsScreen()
      ],
    );
  }
}

class HomeScreenPageControllerHandler {
  void onPageChanged(int index) {}
}

