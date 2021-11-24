import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyProfile.dart';
import '../Constants.dart' as K;
import 'HomeScreen.dart';
import 'NotificationPage.dart';
import 'AddRepository.dart';
import 'package:jiit_hub/screens/Methods.dart';
import 'ExplorePage.dart';
import 'MyProfilePage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex=0;
  int selectedPage = 0;
  final _PageOptions=[
    HomeScreen(),
    NotificationPage(),
    ExplorePage(),
    MyProfile()
  ];

  void _onTap(int index){
    setState((){
      selectedIndex=index;
      selectedPage=index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              // title: Text('JIIT HUB!'),
              title:Center(child: Text('JIIT HUB')),
              backgroundColor: Colors.blueGrey[800],
              leading: Icon(Icons.icecream_outlined),
              actions: [
                GestureDetector(child: IconButton(
                    icon: Icon(Icons.person, size: 32,), onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),),
                GestureDetector(child: IconButton(
                    icon: Icon(Icons.add_circle, size: 32,), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){return AddRepository();}));
                }),)
              ]),
          body:_PageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.globe),label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          onTap: _onTap,
        ),

      ),
    );
  }
}