import 'package:flutter/material.dart';
import 'package:ini_pokemon/aboutapplication.dart';
import 'package:ini_pokemon/homepage.dart';
import 'package:ini_pokemon/profile.dart';



class botnavbar extends StatefulWidget {
  @override
  _botnavbarState createState() => _botnavbarState();
}

class _botnavbarState extends State<botnavbar> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomePage(),
    ProfilePage(),
    AboutApplicationPage()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.orangeAccent,
         type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}



