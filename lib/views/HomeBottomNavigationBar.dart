import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatefulWidget {

  const HomeBottomNavigationBar({Key key}) : super(key: key);

  @override
  HomeBottomNavigationBarState createState() => HomeBottomNavigationBarState();
}

class HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Map"),
            backgroundColor: Colors.purple),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            backgroundColor: Colors.purple),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
            backgroundColor: Colors.purple),
      ],
      currentIndex: currentPageIndex,
    );
  }

  void onPageChanged(int newPageIndex) {
    setState(() {
      currentPageIndex = newPageIndex;
    });
  }
}