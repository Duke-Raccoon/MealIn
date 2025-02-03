import 'package:flutter/material.dart';

class ShowQuantity {
  static Future showQuantity(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 3)),
            backgroundColor: Colors.pinkAccent,
            title: Center(
              child: Padding(
                padding: EdgeInsets.all(h * 0.01),
                child: Text(
                  'Units of measurement',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.05),
                ),
              ),
            ),
          );
        });
  }
}
