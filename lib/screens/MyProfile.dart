import 'package:flutter/material.dart';
import 'package:jiit_hub/responsive_constants.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              child: Text('College'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                width: Responsive.width(80, context),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:
                      InputDecoration(labelText: ' ', hintText: 'Tanishk'),
                ),
              ),
            ),
            Container(
              child: Text('Year'),
            ),
            Container(
              child: Text('Department'),
            ),
            Container(
              child: Text('Class'),
            ),
            Container(
              child: Text('Invite'),
            ),
          ],
        ),
      ),
    );
  }
}
