import 'package:flutter/material.dart';

class CustomProgressindicator extends StatelessWidget {
  const CustomProgressindicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.grey.withOpacity(0.1),
        padding: const EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              // spreadRadius: 5,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
