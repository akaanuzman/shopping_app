import 'package:flutter/material.dart';
import '../../../core/extensions/app_extensions.dart';

class PrimaryBoldText extends Text {
  PrimaryBoldText({
    Key? key,
    required BuildContext context,
    required String data,
  }) : super(
          data,
          key: key,
          style: TextStyle(
            color: context.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        );
}
