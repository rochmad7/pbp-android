import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/views/account_view.dart';
import 'package:news_app/views/favorite_view.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/search_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavView = [
    HomeView(),
    SearchView(),
    FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _bottomNavView.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: _navBarList
            .map(
              (e) => BottomNavigationBarItem(
                icon: (
                  e.icon
                ),
                activeIcon: (
                  e.activeIcon
                ),
                label: e.title,
              ),
            )
            .toList(),
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.home, size: 24,),
        //     activeIcon: Icon(Icons.home, size: 24,),
        //     title: Text("Home"),),
        //   BottomNavigationBarItem(
        //     icon: Icon(MdiIcons.homeOutline, size: 24,),
        //     activeIcon: Icon(MdiIcons.homeOutline, size: 24,),
        //     title: Text("Search"),),
        //   BottomNavigationBarItem(
        //     icon: Icon(MdiIcons.home, size: 24,),
        //     activeIcon: Icon(MdiIcons.homeOutline, size: 24,),
        //     title: Text("Home"),),
        // ]
      ),
    );
  }
}

class NavBarItem {
  final Icon icon;
  final Icon activeIcon;
  final String title;
  NavBarItem({this.icon, this.activeIcon, this.title});
}

List<NavBarItem> _navBarList = [
  NavBarItem(
    icon: Icon(Icons.home, size: 30,),
    activeIcon: Icon(Icons.home, size: 30,),
    title: "Home",
  ),
  NavBarItem(
    icon: Icon(Icons.search, size: 30,),
    activeIcon: Icon(Icons.search, size: 30,),
    title: "Search",
  ),
  NavBarItem(
    icon: Icon(Icons.apps, size: 30,),
    activeIcon: Icon(Icons.apps, size: 30,),
    title: "Categories",
  ),
  // NavBarItem(
  //   icon: "assets/account.svg",
  //   activeIcon: "assets/account_2.svg",
  //   title: "Account",
  // ),
];
