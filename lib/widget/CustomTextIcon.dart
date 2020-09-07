import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {
  final Icon icons;
  final String label;
  final String showText;
  const CustomTextIcon({Key key, this.icons, this.label, this.showText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff153F59), width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            child: icons,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    showText,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
