import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final String text;
  final List<IconData> icons;
  final int selectIndex;
  final Function onTap;

  const CustomNavigationBar(
      {Key key, this.text, this.icons, this.selectIndex, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<IconData> _selectIcon = [
      Icons.list,
      Icons.account_circle,
    ];

    final List<String> _title = [
      'List',
      'user',
    ];

    return Container(
      color: Colors.pink,
      padding: EdgeInsets.only(
        right: 5.0,
        left: 5.0,
      ),
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        onTap: onTap,
        indicatorPadding: EdgeInsets.zero,
        indicatorColor: Color(0xff153F59),
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
                  i,
                  Tab(text: _title[i], icon: Icon(e)),
                ))
            .values
            .toList(),
      ),
    );
  }
}
