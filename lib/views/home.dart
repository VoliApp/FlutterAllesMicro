import 'package:flutter/material.dart';
import 'package:voli/components/keepAlive.dart';
import 'package:voli/util/topToBottomRoute.dart';
import 'package:voli/views/createPost.dart';
import 'package:voli/views/homePages/start.dart';

import 'homePages/notifications.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController();
  double paddingLeft = 0;
  int page = 0;

  List<BottomNavigationBarItem> itemsBottom = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications_outlined),
        activeIcon: Icon(Icons.notifications),
        label: 'Notifications'),
  ];

  void goToPage(int index) {
    setState(() => page = index);
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          onPageChanged: (index) => setState(() => page = index),
          controller: pageController,
          children: [
            KeepAlivePage(Start()),
            Notifications(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () => Navigator.push(
            context, TopToBottomRoute(builder: (context) => CreatePost())),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: page,
        onTap: goToPage,
        items: itemsBottom,
      ),
    );
  }
}
