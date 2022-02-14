import 'package:flutter/material.dart';

class ProductName extends Text {
  const ProductName({Key? key, required String data})
      : super(
          data,
          key: key,
          maxLines: 2,
          textAlign: TextAlign.center,
        );
}
