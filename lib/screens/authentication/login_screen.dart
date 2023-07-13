import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_graph/consts/sizes.dart';
import 'package:insta_graph/cubits/app/app_cubit.dart';
import 'package:insta_graph/helpers/size_extentions.dart';
import 'package:insta_graph/widgets/buttons/authentication_button.dart';

import '../../widgets/textfields/authentication_textfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
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
                        materialColors,
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
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  AuthenticationTextField(
                    width: 400.0.w,
                    height: 40.0.h,
                    hint: 'Password',
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  AuthenticationButton(
                    width: 400.0.w,
                    height: 40.0.h,
                    text: 'Log In',
                    isNotEmpty: false,
                    onPress: () {},
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
              color: materialColors,
              width: 300.0.w,
              height: 0.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont have an account?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Sign up.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
