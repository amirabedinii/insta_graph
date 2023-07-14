import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_graph/helpers/size_extentions.dart';
import 'package:insta_graph/widgets/buttons/authentication_button.dart';

import '../../consts/sizes.dart';
import '../../cubits/app/app_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final materialColors =
        switch (context.watch<AppCubit>().themeNotifier.value) {
      ThemeMode.system =>
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark
            ? Colors.white
            : Colors.black,
      ThemeMode.light => Colors.black,
      ThemeMode.dark => Colors.white
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.0.h,
                  ),
                  SizedBox(
                    width: 170.0.w,
                    height: 150.0.h,
                    child: SvgPicture.asset(
                      'assets/images/instagram_logo.svg',
                      colorFilter: ColorFilter.mode(
                        materialColors,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
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
                        color: materialColors,
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
                        color: materialColors,
                        width: 120.0.w,
                        height: 1.0.h,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign up with email or phone number'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130.0.h,
            ),
            Container(
              color: materialColors,
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
          ],
        ),
      ),
    );
  }
}
