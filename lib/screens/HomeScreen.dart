import 'package:flutter/material.dart';
import 'package:jiit_hub/screens/Methods.dart';
import 'package:jiit_hub/screens/Repositories.dart';
import '../Constants.dart' as K;
import 'package:jiit_hub/responsive_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:jiit_hub/styles/app_text_style.dart';
import 'package:jiit_hub/styles/app_color.dart';
import 'AddBadge.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.primaryLight, AppColor.primary]),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset("Assets/Vector.png"),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0, left: 10.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundImage: AssetImage("Assets/student.jpg"),
                          backgroundColor: Colors.transparent,
                        ),
                        height: Responsive.height(15, context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0, left: 10.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage(
                                  "Assets/badge-removebg-preview.png"),
                              backgroundColor: Colors.transparent,
                            ),
                            height: Responsive.height(15, context),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(38),
                    topLeft: Radius.circular(38),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColor.primary,
                                AppColor.primary.withOpacity(0.7)
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Akanksha Chaudhari',
                              style: AppTextStyle.style(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColor.primary,
                                AppColor.primary.withOpacity(0.7)
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Walchand COE, Sangli',
                              style: AppTextStyle.style(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColor.primary,
                                AppColor.primary.withOpacity(0.7)
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Third-Year ',
                              style: AppTextStyle.style(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColor.primary,
                                AppColor.primary.withOpacity(0.7)
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Computer Science and Engineering',
                              style: AppTextStyle.style(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            AppColor.primary.withOpacity(0.7)),
                      ),
                      child: Text(
                        'Add Badge',
                        style: AppTextStyle.style(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddBadge(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

    //   MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     body: Container(height: double.infinity,
    //       width:  double.infinity,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage("Assets/jaypee_building.jpeg"),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       child: Column(
    //     children: [
    //       SizedBox(height: Responsive.height(10, context),),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 20.0),
    //         child: Container(
    //           alignment: Alignment.topLeft,
    //           child:Image(image: AssetImage("Assets/student.jpg"),),
    //           height: Responsive.height(15, context),
    //
    //           decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    //   ),
    // ),
    // );
  }
}
