import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiit_hub/screens/Methods.dart';
import 'package:jiit_hub/responsive_constants.dart';
import 'package:jiit_hub/styles/app_color.dart';
import 'package:jiit_hub/styles/app_text_style.dart';

import 'package:jiit_hub/screens/HomePage.dart';
import 'SignupPage.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController EnrollmentController = TextEditingController();
  // final TextEditingController DeptController = TextEditingController();

  bool _isSecure = true;
  bool isLoading = false;
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        height: 56,
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white70,
                            width: 2,
                          ),
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
                        child: TextField(
                          style: AppTextStyle.style(
                            color: Colors.white.withOpacity(0.8),
                          ),
                          decoration: InputDecoration(
                            hintText: 'College name',
                            labelText: 'College',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            labelStyle: AppTextStyle.style(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          controller: EnrollmentController,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: Responsive.height(9.7, context),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
