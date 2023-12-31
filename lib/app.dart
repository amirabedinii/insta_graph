import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_graph/cubits/app/app_cubit.dart';
import 'package:insta_graph/cubits/app/app_state.dart';
import 'package:insta_graph/helpers/color_extention.dart';
import 'package:insta_graph/helpers/screen_size_helper.dart';
import 'package:insta_graph/screens/authentication/login_screen.dart';
import 'package:insta_graph/screens/authentication/signup_screen.dart';
import 'package:insta_graph/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.setDeviceSize(context);
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Instagraph',
            debugShowCheckedModeBanner: false,
            theme: ThemeData().copyWith(
                scaffoldBackgroundColor:
                    ThemeData().colors(context).backgroundColor),
            darkTheme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor:
                    ThemeData().colors(context).backgroundColor),
            initialRoute: '',
            routes: {
              '': (context) => const SplashScreen(),
              '/login': (context) => const LogInScreen(),
              '/signup': (context) => const SignUpScreen(),
            },
          );
        },
      ),
    );
  }
}
