import 'package:flutter/material.dart';

const double BORDER_RADIUS = 30;

AppBar applicationMainAppBar() {
  final Radius borderRadius = Radius.circular(BORDER_RADIUS);

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