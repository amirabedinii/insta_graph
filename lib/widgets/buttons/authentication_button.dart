import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final bool isNotEmpty;
  final Function onPress;

  const AuthenticationButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.isNotEmpty,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 0.1 * width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isNotEmpty
              ? const Color.fromARGB(115, 42, 138, 248)
              : const Color.fromARGB(115, 2, 87, 184),
        ),
        onPressed: () => onPress,
        child: Text(text),
      ),
    );
  }
}
