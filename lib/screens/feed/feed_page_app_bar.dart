import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_graph/helpers/color_extention.dart';
import 'package:insta_graph/helpers/size_extentions.dart';

SliverAppBar feedPageAppBar(BuildContext context) {
  return SliverAppBar(
    floating: true,
    centerTitle: false,
    title: SizedBox(
      width: 110.0.w,
      child: SvgPicture.asset(
        'assets/images/instagram_logo.svg',
        colorFilter: ColorFilter.mode(
          ThemeData().colors(context).materialColor,
          BlendMode.srcIn,
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            ThemeData().colors(context).materialColor,
            BlendMode.srcIn,
          ),
          child: Image.asset(
            'assets/images/message_icon.png',
          ),
        ),
      ),
    ],
  );
}
