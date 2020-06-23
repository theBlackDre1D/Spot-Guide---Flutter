import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:spotguide/screens/MapScreen.dart';
import 'package:spotguide/views/MainAppBar.dart';

void main() {
  GoogleMap.init('AIzaSyAPd2qZJ6-x_uhE3R5B5V9YvUAnnA4T3co');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initApp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }

  Future<void> initApp() async {
    await LocationPermissions().requestPermissions();
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: MapScreen(),
      appBar: applicationMainAppBar(),
    );
  }

  BottomNavigationBarItem buildBarItem(IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(text),
      backgroundColor: Colors.purple
    );
  }
}
