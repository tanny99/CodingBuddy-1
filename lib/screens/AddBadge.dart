import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiit_hub/responsive_constants.dart';
import 'HomeScreen.dart';
final int vv=1;
class AddBadge extends StatefulWidget {
  const AddBadge({Key? key}) : super(key: key);

  @override
  _AddBadgeState createState() => _AddBadgeState();
}
enum Detail { skills, awards,jobs }
class _AddBadgeState extends State<AddBadge> {
  @override
  Detail _detail=Detail.skills;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom:30 ),
        child: Container(
          decoration: BoxDecoration(color: Colors.lightBlue,border: Border.all(color: Colors.black,width: 8,),
            borderRadius: BorderRadius.circular(12),),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30,top: 40),
            child: Column(

              children: <Widget>[
                ListTile(
                  title: const Text('Skills',style: TextStyle(color: Colors.white,fontSize: 25),),
                  leading: Radio<Detail>(
                    value: Detail.skills,
                    groupValue: _detail,
                    onChanged: (value) async {
                      setState(() {
                        _detail = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Awards',style: TextStyle(color: Colors.white,fontSize: 25)),
                  leading: Radio<Detail>(
                    value: Detail.awards,
                    groupValue: _detail,
                    onChanged: (value) async {
                      setState(() {
                        _detail = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Jobs held',style: TextStyle(color: Colors.white,fontSize: 25)),
                  leading: Radio<Detail>(
                    value: Detail.jobs,
                    groupValue: _detail,
                    onChanged: (value) async {
                      setState(() {
                        _detail = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Add Details',style: TextStyle(color: Colors.black,fontSize: 35)),
                ),
                Flexible(
                  child: Container(child: Flexible(child: TextField()),height: Responsive.height(30, context),
                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black,width: 3,),)

                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen(vall: 2);}));
                },child: Text('Submit'),),
              )],
            ),
          ),
        ),
      ),
    );
  }
}
