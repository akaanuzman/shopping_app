import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  @JsonKey(ignore: true)
  double count = 0;
  @JsonKey(ignore:  true)
  double productPrice = 1;
  @JsonKey(ignore: true)
  bool isOpen = false;

  HomeModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeModel &&
        other.title == title &&
        other.id == id &&
        other.description == description &&
        other.category == category &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        description.hashCode ^
        category.hashCode ^
        image.hashCode ^
        price.hashCode;
  }
}
