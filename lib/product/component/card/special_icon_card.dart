import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class SpecialIconCard extends Card {
  SpecialIconCard({Key? key, required BuildContext context, required IconData icon})
      : super(
          key: key,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
          child: Padding(
            padding: context.paddingLow,
            child: Icon(
              icon,
              color: context.primaryColor,
            ),
          ),
        );
}
