import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jiit_hub/screens/LoginPage.dart';
import 'package:jiit_hub/screens/Methods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:jiit_hub/responsive_constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import '../Constants.dart' as K;
import 'package:jiit_hub/styles/app_text_style.dart';
import 'package:jiit_hub/styles/app_color.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController EnrollmentController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool _isSecure = true;
  bool isLoading = false;
  bool _isValid = false;

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
                        "Sign-Up to Start Your coding journey",
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
              child: SingleChildScrollView(
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
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8)),
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
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8)),
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
                                        'SIGN UP',
                                        style: AppTextStyle.style(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onPressed: () {
                                        _isValid = EmailValidator.validate(
                                            EmailController.text);
                                        // if (!(_isValid)) {
                                        //   Fluttertoast.showToast(
                                        //       msg: 'Enter a Valid Email',
                                        //       toastLength: Toast.LENGTH_SHORT,
                                        //       gravity: ToastGravity.TOP,
                                        //       timeInSecForIosWeb: 1,
                                        //       fontSize: 16.0);
                                        // }
                                            if (EmailController
                                                .text.isNotEmpty &&
                                            EnrollmentController
                                                .text.isNotEmpty &&
                                            PasswordController
                                                .text.isNotEmpty) {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          createAccount(
                                                  EmailController.text,
                                                  EnrollmentController.text,
                                                  PasswordController.text)
                                              .then((user) {
                                            if (user != null) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          LoginPage()));
                                              print(
                                                  "Account Created Successful");
                                            } else {
                                              print("Account Creation Failed");
                                            }
                                          });
                                        } else {
                                          print("Please enter fields.");
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
                      SizedBox(
                        height: Responsive.height(9.7, context),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
