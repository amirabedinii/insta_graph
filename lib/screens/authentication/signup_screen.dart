import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_graph/cubits/authentication/authentication_cubit.dart';
import 'package:insta_graph/cubits/authentication/authentication_state.dart';
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
  late final AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    authenticationCubit = AuthenticationCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => authenticationCubit,
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        bloc: authenticationCubit,
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Column(
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
                      controller: authenticationCubit.emailOrPhoneController,
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    AuthenticationTextField(
                      width: 400.0.w,
                      height: 40.0.h,
                      hint: 'first Name ',
                      fillColor: ThemeData().colors(context).textFieldColor,
                      controller: authenticationCubit.firstNameController,
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    AuthenticationTextField(
                      width: 400.0.w,
                      height: 40.0.h,
                      hint: 'Last Name',
                      fillColor: ThemeData().colors(context).textFieldColor,
                      controller: authenticationCubit.lastNameController,
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    AuthenticationTextField(
                      width: 400.0.w,
                      height: 40.0.h,
                      hint: 'Username',
                      fillColor: ThemeData().colors(context).textFieldColor,
                      controller: authenticationCubit.usernameController,
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
                      controller: authenticationCubit.passwordController,
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    AuthenticationButton(
                      width: 400.0.w,
                      height: 40.0.h,
                      text: 'sign up',
                      isNotEmpty: false,
                      onPress: () async {
                        bool signup=  await authenticationCubit.signUp();
                        if(signup){
                         showDialog(context: context, builder: (context)=>AlertDialog(
                           title: Text('Sign up'),
                           content: Text('Sign up is successful'),
                           actions: [
                             TextButton(onPressed: (){
                               Navigator.pop(context);
                             }, child: Text('OK'))
                           ],
                         ));
                        }else {
                          showDialog(context: context, builder: (context)=>AlertDialog(
                            title: Text('Sign up'),
                            content: Text('Sign up is failed'),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('OK'))
                            ],
                          ));
                        }
                      },
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
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By signing up, you agree to our ",
                        style: TextStyle(
                          color: ThemeData().colors(context).materialColor,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms",
                            style: TextStyle(
                              color: ThemeData().colors(context).materialColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: ", ",
                            style: TextStyle(
                              color: ThemeData().colors(context).materialColor,
                            ),
                          ),
                          TextSpan(
                            text: "Data Policy",
                            style: TextStyle(
                              color: ThemeData().colors(context).materialColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                              color: ThemeData().colors(context).materialColor,
                            ),
                          ),
                          TextSpan(
                            text: "Cookies Policy",
                            style: TextStyle(
                              color: ThemeData().colors(context).materialColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: distance20,
                    ),
                    Container(
                      color: ThemeData().colors(context).materialColor,
                      width: 300.0.w,
                      height: 0.5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Log in.'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
