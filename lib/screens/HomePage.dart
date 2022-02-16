import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyProfile.dart';
import '../Constants.dart' as K;
import 'HomeScreen.dart';
import 'AddRepository.dart';
import 'package:jiit_hub/screens/Methods.dart';
import 'add_image.dart';
import 'MyProfilePage.dart';

class HomePage extends StatefulWidget {
  final int indexx;
  const HomePage({required this.indexx});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late int indexx;
  late int selectedIndex = widget.indexx;
  late int selectedPage = widget.indexx;

  final _PageOptions = [HomeScreen(), MyProfile()];

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //     title:Center(child: Text('Coding Buddy')),
        //     backgroundColor: Color.fromRGBO(29, 53, 87, 1),
        //     leading: Icon(Icons.icecream_outlined),
        //     actions: [
        //       // GestureDetector(child: IconButton(
        //       //     icon: Icon(Icons.person, size: 32,), onPressed: () {
        //       //   Navigator.push(context,
        //       //       MaterialPageRoute(builder: (context) => MyProfile()));
        //       // }),),
        //       GestureDetector(child: IconButton(
        //           icon: Icon(Icons.add_circle, size: 32,), onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context){return AddImage();}));
        //       }),)
        //     ]),
        body: _PageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.indigo,
          fixedColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey,
          // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          elevation: 100,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_sharp), label: 'College'),
          ],
          currentIndex: selectedIndex,
          onTap: _onTap,
        ),
      ),
    );
  }
}
