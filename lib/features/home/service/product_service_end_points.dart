// ignore_for_file: constant_identifier_names

enum ProductServiceEndPoints { PRODUCTS }

extension ProductServiceExtension on ProductServiceEndPoints {
  String get rawValue {
    switch (this) {
      case ProductServiceEndPoints.PRODUCTS:
        return 'products';
    }
  }
}
