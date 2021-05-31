import 'package:crypto_app/pages/explorer.dart';
import 'package:crypto_app/pages/markets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  List<Widget> _mainScreens = [
    Markets(),
    Explorer(),
    // Text("Third page"),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBar _buildBottomAppBar() {
    return BottomNavigationBar(
      onTap: _onPageChanged,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: ""),
        // BottomNavigationBarItem(icon: Icon(Icons.book), label: "")
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _mainScreens[_selectedIndex],
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }
}
