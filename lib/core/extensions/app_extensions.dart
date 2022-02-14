import 'package:flutter/material.dart';
import '../init/theme/custom_theme.dart';

class AppExt {}

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get appTheme => Theme.of(this);
  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(milliseconds: 500);
  Duration get durationNormal => const Duration(seconds: 1);
  Duration get durationSlow => const Duration(seconds: 2);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  EdgeInsets get horizontalPaddingLow =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalPaddingNormal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalPaddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalPaddingHigh =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get verticalPaddingLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalPaddingNormal =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalPaddingMedium =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalPaddingHigh =>
      EdgeInsets.symmetric(vertical: highValue);
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => Radius.circular(width * 0.02);
  Radius get normalRadius => Radius.circular(width * 0.05);
  Radius get highadius => Radius.circular(width * 0.1);
}

extension BorderExtension on BuildContext {
  BorderRadius get normalBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.05));
  BorderRadius get lowBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.02));
  BorderRadius get highBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.1));

  RoundedRectangleBorder get roundedRectangleBorderLow =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(lowValue)));

  RoundedRectangleBorder get roundedRectangleAllBorderNormal =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(normalValue));

  RoundedRectangleBorder get roundedRectangleBorderNormal =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(normalValue)));

  RoundedRectangleBorder get roundedRectangleBorderMedium =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(mediumValue)));

  RoundedRectangleBorder get roundedRectangleBorderHigh =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(highValue)));
}

class SpaceSizedHeightBox extends StatelessWidget {
  final double height;

  const SpaceSizedHeightBox({Key? key, required this.height})
      : assert(height > 0 && height <= 1),
        super(key: key);
  @override
  Widget build(BuildContext context) =>
      SizedBox(height: context.height * height);
}

class SpaceSizedWidthBox extends StatelessWidget {
  final double width;

  const SpaceSizedWidthBox({Key? key, required this.width})
      : assert(width > 0 && width <= 1),
        super(key: key);
  @override
  Widget build(BuildContext context) => SizedBox(width: context.width * width);
}

extension SizedBoxExtension on BuildContext {
  Widget get emptySizedWidthBoxLow => const SpaceSizedWidthBox(width: 0.01);
  Widget get emptySizedWidthBoxLow2x => const SpaceSizedWidthBox(width: 0.02);
  Widget get emptySizedWidthBoxLow3x => const SpaceSizedWidthBox(width: 0.03);
  Widget get emptySizedWidthBoxLow4x => const SpaceSizedWidthBox(width: 0.04);
  Widget get emptySizedWidthBoxNormal => const SpaceSizedWidthBox(width: 0.05);
  Widget get emptySizedWidthBoxHigh => const SpaceSizedWidthBox(width: 0.1);

  Widget get emptySizedHeightBoxExtraLow =>
      const SpaceSizedHeightBox(height: 0.005);
  Widget get emptySizedHeightBoxLow => const SpaceSizedHeightBox(height: 0.01);
  Widget get emptySizedHeightBoxLow2x =>
      const SpaceSizedHeightBox(height: 0.02);
  Widget get emptySizedHeightBoxLow3x =>
      const SpaceSizedHeightBox(height: 0.03);
  Widget get emptySizedHeightBoxLow4x =>
      const SpaceSizedHeightBox(height: 0.04);
  Widget get emptySizedHeightBoxNormal =>
      const SpaceSizedHeightBox(height: 0.05);
  Widget get emptySizedHeightBoxHigh => const SpaceSizedHeightBox(height: 0.1);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => CustomTextTheme(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get primaryColor => const Color(0xFF5c3fbc);
  Color get secondaryColor => const Color(0xFFdadbfe);
  Color get secondaryVariant => const Color(0xFFffd301);

  // I use Apple Human Interface Guidelines
  // For detailed information: https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
  Color get red => isDarkMode
      ? const Color.fromARGB(255, 255, 69, 58)
      : const Color.fromARGB(255, 255, 59, 48);

  Color get orange => isDarkMode
      ? const Color.fromARGB(255, 255, 159, 10)
      : const Color.fromARGB(255, 255, 149, 0);

  Color get yellow => isDarkMode
      ? const Color.fromARGB(255, 255, 214, 10)
      : const Color.fromARGB(255, 255, 204, 0);

  Color get green => isDarkMode
      ? const Color.fromARGB(255, 48, 209, 88)
      : const Color.fromARGB(255, 52, 199, 89);

  Color get teal => isDarkMode
      ? const Color.fromARGB(255, 100, 210, 255)
      : const Color.fromARGB(255, 90, 200, 250);

  Color get blue => isDarkMode
      ? const Color.fromARGB(255, 10, 132, 255)
      : const Color.fromARGB(255, 0, 122, 255);

  Color get indigo => isDarkMode
      ? const Color.fromARGB(255, 94, 92, 230)
      : const Color.fromARGB(255, 88, 86, 214);

  Color get purple => isDarkMode
      ? const Color.fromARGB(255, 191, 90, 242)
      : const Color.fromARGB(255, 175, 82, 222);

  Color get pink => isDarkMode
      ? const Color.fromARGB(255, 255, 55, 95)
      : const Color.fromARGB(255, 255, 45, 85);

  Color get grey => isDarkMode
      ? const Color.fromARGB(255, 142, 142, 147)
      : const Color.fromARGB(255, 142, 142, 147);

  Color get grey2 => isDarkMode
      ? const Color.fromARGB(255, 99, 99, 102)
      : const Color.fromARGB(255, 174, 174, 178);

  Color get grey3 => isDarkMode
      ? const Color.fromARGB(255, 72, 72, 74)
      : const Color.fromARGB(255, 199, 199, 204);

  Color get grey4 => isDarkMode
      ? const Color.fromARGB(255, 58, 58, 60)
      : const Color.fromARGB(255, 209, 209, 214);

  Color get grey5 => isDarkMode
      ? const Color.fromARGB(255, 44, 44, 46)
      : const Color.fromARGB(255, 229, 229, 234);

  Color get grey6 => isDarkMode
      ? const Color.fromARGB(255, 28, 28, 30)
      : const Color.fromARGB(255, 242, 242, 247);

  Color get label => isDarkMode
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromARGB(255, 0, 0, 0);

  Color get secondaryLabel => isDarkMode
      ? const Color(0xff8083A3)
      : const Color.fromARGB(153, 60, 60, 67);

  Color get tertiaryLabel => isDarkMode
      ? const Color.fromARGB(153, 235, 235, 245)
      : const Color.fromARGB(153, 60, 60, 67);

  Color get quaternaryLabel => isDarkMode
      ? const Color.fromARGB(40, 235, 235, 245)
      : const Color.fromARGB(45, 60, 60, 67);

  Color get background => isDarkMode
      ? const Color.fromARGB(255, 0, 0, 0)
      : const Color.fromARGB(255, 255, 255, 255);

  Color get secondaryBackground => isDarkMode
      ? const Color.fromARGB(255, 28, 28, 30)
      : const Color.fromARGB(255, 242, 242, 247);

  Color get tertiaryBackground => isDarkMode
      ? const Color.fromARGB(255, 44, 44, 46)
      : const Color.fromARGB(255, 255, 255, 255);

  Color get groupedBackground => isDarkMode
      ? const Color.fromARGB(255, 44, 44, 46)
      : const Color.fromARGB(255, 242, 242, 247);

  Color get secondaryGroupedBackground => isDarkMode
      ? const Color.fromARGB(255, 28, 28, 30)
      : const Color.fromARGB(255, 255, 255, 255);

  Color get tertiaryGroupedBackground => isDarkMode
      ? const Color.fromARGB(255, 44, 44, 46)
      : const Color.fromARGB(255, 242, 242, 247);

  Color get cyan => isDarkMode
      ? const Color.fromRGBO(100, 210, 255, 1)
      : const Color.fromRGBO(100, 210, 255, 1);

  Color get mint => isDarkMode
      ? const Color.fromRGBO(102, 212, 207, 1)
      : const Color.fromRGBO(0, 199, 190, 1);

  Color get brown => isDarkMode
      ? const Color.fromRGBO(172, 142, 104, 1)
      : const Color.fromRGBO(162, 132, 94, 1);

  Color get seperatorColor => isDarkMode
      ? const Color.fromRGBO(84, 84, 88, 0.6)
      : const Color.fromRGBO(60, 60, 67, 0.29);

  Color get opaqueSeperatorColor => isDarkMode
      ? const Color.fromRGBO(56, 56, 58, 1)
      : const Color.fromRGBO(198, 198, 200, 1);

  Color get placeholderColor => isDarkMode
      ? const Color.fromRGBO(235, 235, 245, 0.3)
      : const Color.fromRGBO(60, 60, 67, 0.3);
}
