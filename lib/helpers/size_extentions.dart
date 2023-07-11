import 'package:insta_graph/helpers/screen_size_helper.dart';

extension ScreenSizeExt on double {
  double get h {
    return (this / ScreenSize.baseHeight) * ScreenSize.deviceHeight!;
  }

  double get w {
    return (this / ScreenSize.baseWidth) * ScreenSize.deviceWidth!;
  }
}
