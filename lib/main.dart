import 'package:flutter/material.dart';
import 'package:insta_graph/app.dart';
import 'package:insta_graph/services/auth_services.dart';

void main() async {
  final authServices = AuthServices();
  WidgetsFlutterBinding.ensureInitialized();
  await authServices.init();
  runApp(const MyApp());
}
