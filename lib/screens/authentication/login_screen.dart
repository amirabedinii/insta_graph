import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_graph/consts/sizes.dart';
import 'package:insta_graph/cubits/authentication/authentication_cubit.dart';
import 'package:insta_graph/cubits/authentication/authentication_state.dart';
import 'package:insta_graph/helpers/color_extention.dart';
import 'package:insta_graph/helpers/size_extentions.dart';
import 'package:insta_graph/widgets/buttons/authentication_button.dart';

import '../../widgets/textfields/authentication_textfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late final AuthenticationCubit authenticationCubit;

  @override
  initState() {
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
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100.0.h,
                          ),
                          SizedBox(
                            width: 170.0.w,
                            height: 80.0.h,
                            child: SvgPicture.asset(
                              'assets/images/instagram_logo.svg',
                              colorFilter: ColorFilter.mode(
                                ThemeData().colors(context).materialColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          AuthenticationTextField(
                            width: 400.0.w,
                            height: 40.0.h,
                            hint: 'Phone number, email or username',
                            fillColor:
                                ThemeData().colors(context).textFieldColor,
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
                            fillColor:
                                ThemeData().colors(context).textFieldColor,
                            controller: authenticationCubit.passwordController,
                          ),
                          SizedBox(
                            height: 12.0.h,
                          ),
                          AuthenticationButton(
                            width: 400.0.w,
                            height: 40.0.h,
                            text: 'Log In',
                            isNotEmpty: false,
                            onPress: () async {
                             bool login=await authenticationCubit.logIn();
                             if(login){
                              showDialog(context: context, builder: (context)=>AlertDialog(
                                title: Text('Login'),
                                content: Text('Login Successful'),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('OK'))
                                ],
                              ));
                             }
                             else {
                               showDialog(context: context, builder: (context)=>AlertDialog(
                                 title: Text('Login'),
                                 content: Text('Login Failed'),
                                 actions: [
                                   TextButton(onPressed: (){
                                     Navigator.pop(context);
                                   }, child: Text('OK'))
                                 ],
                               ));
                             }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Forgot your login details?'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Get help logging in'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color:
                                    ThemeData().colors(context).materialColor,
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
                                color:
                                    ThemeData().colors(context).materialColor,
                                width: 120.0.w,
                                height: 1.0.h,
                              ),
                            ],
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook),
                            label: const Text(
                              'Log in with Facebook',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 170.0.h,
                    ),
                    Container(
                      color: ThemeData().colors(context).materialColor,
                      width: 300.0.w,
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: const Text('Sign up.'),
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
