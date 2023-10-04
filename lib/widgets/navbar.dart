import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:logbook/pages/Profilpage.dart';
import 'package:logbook/widgets/Homepage.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home(
      title: '',
    ),
    // const SearchPage(),
    // const DataPosts(),
    const Profilpage(),
    // Add your additional screens here
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isPotrait = orientation == Orientation.portrait;
        // bool isLandscape = orientation == Orientation.landscape;

        if (isPotrait) {
          return Scaffold(
            body: _screens[_currentIndex],
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.blue,
              items: [
                TabItem(icon: Icons.home, title: 'Home'),
                // TabItem(icon: Icons.search, title: 'Search'),
                // TabItem(icon: Icons.add, title: 'Data Post'),
                TabItem(icon: Icons.person_2, title: 'My Profile'),
                // Add your additional tabs here
              ],
              initialActiveIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          );
        }

        return Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.blue,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              // TabItem(icon: Icons.search, title: 'Search'),
              // TabItem(icon: Icons.add, title: 'Data Post'),
              TabItem(icon: Icons.person_2, title: 'My Profile'),
              // Add your additional tabs here
            ],
            initialActiveIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
