import 'package:flutter/cupertino.dart';
import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'package:jiit_hub/screens/HomePage.dart';
import 'package:jiit_hub/screens/SignupPage.dart';
import 'package:jiit_hub/responsive_constants.dart';
import 'package:jiit_hub/screens/Methods.dart';
import 'package:jiit_hub/styles/app_text_style.dart';
import 'package:jiit_hub/styles/app_color.dart';
import '../Constants.dart' as K;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController EnrollmentController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

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
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset("Assets/splash.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Hello Buddy",
                        style: AppTextStyle.style(
                            fontSize: 34, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "login to Continue",
                        style: AppTextStyle.style(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.4),
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(38),
                    topLeft: Radius.circular(38),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextField(
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Hipporasy@gmail.com',
                        labelText: 'Email',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.8)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.8)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.8)),
                        ),
                        labelStyle: AppTextStyle.style(
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      controller: EnrollmentController,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: _isSecure,
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSecure = !_isSecure;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: _isSecure
                                  ? Colors.black.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        labelText: 'Password',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.8)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.8)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.8)),
                        ),
                        labelStyle: AppTextStyle.style(
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      controller: PasswordController,
                    ),
                    SizedBox(height: 32),
                    Container(
                      height: 56,
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(AppColor
                                              .primary
                                              .withOpacity(0.7)),
                                    ),
                                    child: Text(
                                      'LOGIN',
                                      style: AppTextStyle.style(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () async {
                                      if (EnrollmentController
                                              .text.isNotEmpty &&
                                          PasswordController.text.isNotEmpty) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        LogIn(EnrollmentController.text,
                                                PasswordController.text)
                                            .then((user) {
                                          if (user != null) {
                                            print("Login Successful");
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => HomePage(
                                                          indexx: 0,
                                                        )));
                                          } else {
                                            print("Login failed");
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        });
                                      } else {
                                        print("Please fill the form correctly");
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 20),
                          //   child: Icon(Icons.arrow_forward,
                          //       color: Colors.white, size: 32),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CreateAccount()));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, right: 50),
                            child: Text(
                              'Not registered?',
                              style: AppTextStyle.style(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Responsive.height(9.7, context),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
