import 'package:flutter/material.dart';
import 'package:jiit_hub/screens/Methods.dart';
import 'package:jiit_hub/screens/Repositories.dart';
import '../Constants.dart' as K;
import 'package:jiit_hub/responsive_constants.dart';
import 'package:flutter/cupertino.dart';
import 'ChatScreen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(height: double.infinity,
          width:  double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/jaypee_building.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
        children: [
          SizedBox(height: Responsive.height(10, context),),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              alignment: Alignment.topLeft,
              child:Image(image: AssetImage("Assets/student.jpg"),),
              height: Responsive.height(15, context),

              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
      ),
    ),
    );
  }
}
