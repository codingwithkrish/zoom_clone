import 'package:flutter/material.dart';
import 'package:zoom_clone/Widgets/homemetting.dart';
import 'package:zoom_clone/screens/history.dart';
import 'package:zoom_clone/screens/meeting.dart';
import 'package:zoom_clone/screens/profile.dart';
import 'package:zoom_clone/utils/colors.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  onpagechanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [meeting(), HistoryMeet(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Meet & Chat"),
        centerTitle: true,
        backwardsCompatibility: false,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onpagechanged,
          currentIndex: _page,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
