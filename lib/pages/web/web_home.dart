import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:kta/pages/web/navbar/Navbar.dart';
import 'package:kta/shared/theme.dart';

class web_home extends StatefulWidget {
  const web_home({super.key});

  @override
  State<web_home> createState() => _web_homeState();
}

class _web_homeState extends State<web_home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 25),
              height: 50,
              width: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/ktalogo.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            // Text('OK KTA '),
            // DecoratedBox(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/ktalogo.png'),
            //     ),
            //   ),
            // ),
            Container(
              child: IconButton(
                  onPressed: (() => {}),
                  icon: const Icon(Icons.bookmark_border)),
            ),

            const NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Saved',
            ),
          ],
        ),
        <Widget>[
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('Page 1'),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Page 2'),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Page 3'),
          ),
        ][currentPageIndex],
      ],
    ));
  }
}
