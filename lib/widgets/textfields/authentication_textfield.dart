import 'package:flutter/material.dart';

class AuthenticationTextField extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController? controller;
  final bool isPassword;
  final String? hint;
  final TextInputType? textInputType;
  final Color? fillColor;

  const AuthenticationTextField({
    super.key,
    required this.width,
    required this.height,
    this.controller,
    this.isPassword= false ,
    this.hint,
    this.textInputType,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        obscureText: isPassword ,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor:fillColor ??const Color.fromARGB(255, 68, 68, 68),
          filled: true,
          hintText: hint,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
        ),
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
