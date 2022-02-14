import 'package:flutter/material.dart';
import '../../../core/extensions/app_extensions.dart';

class BoldTitle extends Text {
  BoldTitle({Key? key, required String data, required BuildContext context,Color? color})
      : super(
          data,
          key: key,
          style: context.textTheme.headline6!.copyWith(
            color: color ?? context.secondaryVariant,
            fontWeight: FontWeight.bold,
          ),
        );
}
