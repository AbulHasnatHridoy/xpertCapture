import 'package:flutter/material.dart';
import 'orders_page.dart';
import 'visits_page.dart';
import 'profile_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex=0;
  static List <Widget>_pages=<Widget>[
    OrdersPage(),
    VisitsPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mini SFA App")
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label:"Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.location_on),
            label: "Visits"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label:"Profile"
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}