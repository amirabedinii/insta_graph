import 'package:flutter/material.dart';
import 'package:insta_graph/helpers/color_extention.dart';

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
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isNotEmpty
              ? ThemeData().colors(context).nonEmptyButtonColor
              : ThemeData().colors(context).emptyButtonColor,
        ),
        onPressed: () => onPress,
        child: Text(text),
      ),
    );
  }
}
