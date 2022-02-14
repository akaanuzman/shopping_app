import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class SpecialTextCard extends Card {
  SpecialTextCard(
      {Key? key, required BuildContext context, required String data})
      : super(
          key: key,
          elevation: 5,
          color: context.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
          child: Padding(
            padding: context.paddingNormal,
            child: Text(
              data,
              style: TextStyle(color: context.background),
            ),
          ),
        );
}
