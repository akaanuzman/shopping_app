import 'package:flutter/material.dart';
import '../../../core/extensions/app_extensions.dart';
import '../text/primary_bold_text.dart';

class SpecialButton extends ElevatedButton {
  SpecialButton(
      {Key? key, void Function()? onTap, required BuildContext context})
      : super(
          onPressed: onTap ?? () {},
          child: PrimaryBoldText(context: context, data: 'Try again'),
          style: _style(context),
          key: key,
        );

  static ButtonStyle _style(BuildContext context) => ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return context.primaryColor.withOpacity(0.2);
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return context.primaryColor.withOpacity(0.2);
            }
            return context.primaryColor;
          },
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(context.secondaryVariant),
      );
}
