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
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      bloc: authenticationCubit,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150.0.w,
                      ),
                      SizedBox(
                        width: 170.0.w,
                        height: 150.0.h,
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
                      AuthenticationButton(
                        width: 400.0.w,
                        height: 40.0.w,
                        text: 'sign up with facebook',
                        isNotEmpty: false,
                        onPress: () {},
                      ),
                      SizedBox(
                        height: 50.0.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: ThemeData().colors(context).materialColor,
                            width: 120.0.w,
                            height: 1.0.w,
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
                            height: 1.0.w,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child:
                            const Text('Sign up with email or phone number'),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 130.0.w,
                // ),
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
                        authenticationCubit.nextStep();

                      },
                      child:  Text('Log in. ${state.step ?? 0}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
