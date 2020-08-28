import 'package:flutter/material.dart';
import 'package:travel_app/views/MainPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainPage(),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 33.0,
              ),
              title: Text('A'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 33.0,
                ),
                title: Text('B')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on,
                  size: 33.0,
                ),
                title: Text('C')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 33.0,
                ),
                title: Text('D')),
          ],
          selectedItemColor: Color(0xff254083),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.grey[150],
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
