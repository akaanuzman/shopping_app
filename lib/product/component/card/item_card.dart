import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';
import '../../../features/home/model/home_model.dart';
import '../../../features/home/viewmodel/home_view_model.dart';
import '../image/responsive_image.dart';
import '../text/primary_bold_text.dart';
import '../text/product_name.dart';
import 'special_icon_card.dart';
import 'special_text_card.dart';

class ItemCard extends Stack {
  ItemCard({
    Key? key,
    required BuildContext context,
    required HomeModel model,
    required HomeViewModel viewModel,
  }) : super(
          key: key,
          children: [
            _productCard(context, model),
            _incrementDeincrementButtons(viewModel, model, context)
          ],
        );

  static Card _productCard(BuildContext context, HomeModel model) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            children: [
              _productImage(model),
              context.emptySizedHeightBoxLow,
              Expanded(
                flex: 2,
                child: _productTitle(model),
              ),
              Expanded(
                child: _price(model, context),
              )
            ],
          ),
        ),
      );

  static AspectRatio _productImage(HomeModel model) {
    String imageUrl = model.image ?? '';
    return ResponsiveImage(aspectRaito: 2.5, imageUrl: imageUrl);
  }

  // Product title text
  static Text _productTitle(HomeModel model) {
    String productTitle = '${model.title}';
    return ProductName(data: productTitle);
  }

  // Price text
  static Text _price(HomeModel model, BuildContext context) {
    String priceText = 'Price: ${model.price.toString()} \$';
    return PrimaryBoldText(context: context, data: priceText);
  }

  static Positioned _incrementDeincrementButtons(
          HomeViewModel viewModel, HomeModel model, BuildContext context) =>
      Positioned(
        right: -2,
        top: -5,
        child: Column(
          children: [
            // Increment count button
            GestureDetector(
              onTap: () => viewModel.incrementCount(model),
              child: SpecialIconCard(context: context, icon: Icons.add),
            ),
            // Show count and deincrement count button method
            _animatedButtons(viewModel, model, context),
          ],
        ),
      );

  static AnimatedOpacity _animatedButtons(
      HomeViewModel viewModel, HomeModel model, BuildContext context) {
    double openValue = model.isOpen ? 1 : 0;
    String count = model.count.toString().substring(0, 1);
    return AnimatedOpacity(
      opacity: openValue,
      duration: context.durationLow,
      child: Column(
        children: [
          // Count card
          SpecialTextCard(
            context: context,
            data: count,
          ),
          // Deincrement count button
          GestureDetector(
            onTap: () => viewModel.deIncrementCount(model),
            child: SpecialIconCard(
              context: context,
              icon: Icons.remove,
            ),
          ),
        ],
      ),
    );
  }
}
