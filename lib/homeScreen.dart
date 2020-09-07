import 'package:flutter/material.dart';
import 'package:flutterchat/screen/list_screen.dart';
import 'package:flutterchat/screen/user_screen.dart';
import 'package:flutterchat/widget/customBottonBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ListScreen(),
    UserScreen(),
  ];
  final List<IconData> _selectIcon = [
    Icons.list,
    Icons.account_circle,
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: CustomNavigationBar(
          icons: _selectIcon,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectIndex: _selectedIndex,
        ),
      ),
    );
  }
}
