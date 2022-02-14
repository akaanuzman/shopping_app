import 'package:flutter/material.dart';

import '../../extensions/app_extensions.dart';

class CustomTextTheme extends TextTheme {
  final BuildContext context;

  const CustomTextTheme(this.context);

  @override
  TextStyle get headline1 =>
      Theme.of(context).textTheme.headline1!.copyWith(color: context.label);
  @override
  TextStyle get headline2 =>
      Theme.of(context).textTheme.headline2!.copyWith(color: context.label);
  @override
  TextStyle get headline3 =>
      Theme.of(context).textTheme.headline3!.copyWith(color: context.label);
  @override
  TextStyle get headline4 =>
      Theme.of(context).textTheme.headline4!.copyWith(color: context.label);
  @override
  TextStyle get headline5 =>
      Theme.of(context).textTheme.headline5!.copyWith(color: context.label);
  @override
  TextStyle get headline6 =>
      Theme.of(context).textTheme.headline6!.copyWith(color: context.label);
  @override
  TextStyle get subtitle1 =>
      Theme.of(context).textTheme.subtitle1!.copyWith(color: context.label);
  @override
  TextStyle get subtitle2 =>
      Theme.of(context).textTheme.subtitle2!.copyWith(color: context.label);
  @override
  TextStyle get bodyText1 =>
      Theme.of(context).textTheme.bodyText1!.copyWith(color: context.label);
  @override
  TextStyle get bodyText2 =>
      Theme.of(context).textTheme.bodyText2!.copyWith(color: context.label);
  @override
  TextStyle get caption =>
      Theme.of(context).textTheme.caption!.copyWith(color: context.label);
  @override
  TextStyle get button =>
      Theme.of(context).textTheme.button!.copyWith(color: context.label);
  @override
  TextStyle get overline =>
      Theme.of(context).textTheme.overline!.copyWith(color: context.label);
}
