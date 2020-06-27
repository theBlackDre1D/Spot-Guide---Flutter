import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:spotguide/models/Spot.dart';

class SpotDetailBottomSheet extends StatelessWidget {

  final Radius _cornersRadius = Radius.circular(20);
  final Spot spot;

  SpotDetailBottomSheet({this.spot});

  @override
  Widget build(BuildContext context) {
    return SolidBottomSheet(
      draggableBody: true,
      headerBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: _cornersRadius,
            topLeft: _cornersRadius
          )
        ),
        height: 50,
        child: _createBottomSheetDragger(context)
      ),
      body: _createDetailBody(spot)
    );
  }

  Widget _createBottomSheetDragger(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        height: 8,
        width: 40,
      ),
    );
  }

  Widget _createDetailBody(Spot spot) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
              spot.name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36
              ),
          )
        ),

        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              spot.locationText,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
              ),
            ),
        )
      ],
    );
  }
}