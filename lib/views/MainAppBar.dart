import 'package:flutter/material.dart';

AppBar applicationMainAppBar() {
  return AppBar(
    title: Text("Spot Guide",
      style: TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 8,
  );
}