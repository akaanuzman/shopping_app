import 'package:flutter/material.dart';

import 'special_image.dart';

class ResponsiveImage extends AspectRatio {
  ResponsiveImage({Key? key, required String imageUrl,double? aspectRaito})
      : super(
          key: key,
          aspectRatio: aspectRaito ?? 2,
          child: SpecialImage(
            url: imageUrl,
          ),
        );
}
