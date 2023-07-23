import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_graph/helpers/color_extention.dart';
import 'package:insta_graph/helpers/size_extentions.dart';
import 'package:insta_graph/widgets/buttons/authentication_button.dart';
import 'package:insta_graph/widgets/textfields/authentication_textfield.dart';

import '../../consts/sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: distance20,
                right: distance20,
                top: distance20 * 2,
                bottom: distance20 * 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 170.0.w,
                    height: 100.0.h,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/instagram_logo.svg',
                        colorFilter: ColorFilter.mode(
                          ThemeData().colors(context).materialColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Sign up to see photos and videos from your friends.",
                    style: TextStyle(
                      color: ThemeData().colors(context).materialColor,
                      fontSize: 15.0,
                      
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  AuthenticationTextField(
                    width: 400.0.w,
                    height: 40.0.h,
                    hint: 'Phone Number, Email',
                    fillColor: ThemeData().colors(context).textFieldColor,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  AuthenticationTextField(
                    width: 400.0.w,
                    height: 40.0.h,
                    hint: 'Full Name ',
                    fillColor: ThemeData().colors(context).textFieldColor,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  AuthenticationTextField(
                    width: 400.0.w,
                    height: 40.0.h,
                    hint: 'UserName',
                    fillColor: ThemeData().colors(context).textFieldColor,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  AuthenticationTextField(
                    width: 400.0.w,
                    height: 40.0.h,
                    hint: 'Password',
                    isPassword: true,
                    fillColor: ThemeData().colors(context).textFieldColor,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  AuthenticationTextField(
                    width: 400.0.w,
                    height: 40.0.h,
                    hint: 'Confirm Password',
                    isPassword: true,
                    fillColor: ThemeData().colors(context).textFieldColor,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  AuthenticationButton(
                    width: 400.0.w,
                    height: 40.0.h,
                    text: 'sign up with facebook',
                    isNotEmpty: false,
                    onPress: () {},
                  ),
                  SizedBox(
                    height: 50.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: ThemeData().colors(context).materialColor,
                        width: 120.0.w,
                        height: 1.0.h,
                      ),
                      SizedBox(
                        width: distance10,
                      ),
                      const Text(
                        'OR',
                      ),
                      SizedBox(
                        width: distance10,
                      ),
                      Container(
                        color: ThemeData().colors(context).materialColor,
                        width: 120.0.w,
                        height: 1.0.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: distance12,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "By signing up, you agree to our ",
                      style: TextStyle(
                        color: ThemeData().colors(context).materialColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Terms",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //TODO : Terms
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Spacer(),
            Container(
              color: ThemeData().colors(context).materialColor,
              width: 300.0.w,
              height: 0.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Log in.'),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
