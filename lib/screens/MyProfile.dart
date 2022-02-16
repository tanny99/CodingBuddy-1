import 'package:flutter/material.dart';
import 'package:jiit_hub/responsive_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('about').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Container(

              child: Text(data['name'],style: TextStyle(fontSize: 20),),
            );
          }).toList(),
        );
      },
    );
  }
}
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
