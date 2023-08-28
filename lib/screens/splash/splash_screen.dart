import 'package:flutter/material.dart';
import 'package:insta_graph/helpers/size_extentions.dart';
import 'package:insta_graph/screens/authentication/login_screen.dart';
import 'package:insta_graph/services/auth_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      final authServices = AuthServices();
      final hasToken = authServices.token != '';
      if (hasToken) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => Scaffold(
                      appBar: AppBar(title: const Text('main Screen')),
                    )),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const LogInScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200.0.w,
          height: 200.0.h,
          child: Image.asset('assets/images/instagram_icon.png'),
        ),
      ),
    );
  }
}
