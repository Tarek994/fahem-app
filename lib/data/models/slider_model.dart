import 'package:fahem/core/utilities/enums.dart';

class SliderModel {
  late final int sliderId;
  late final String image;
  late final SliderTarget sliderTarget;
  late final String? value;
  late final String createdAt;

  SliderModel({
    required this.sliderId,
    required this.image,
    required this.sliderTarget,
    required this.value,
    required this.createdAt,
  });

  SliderModel.fromJson(Map<String, dynamic> json) {
    sliderId = int.parse(json['sliderId'].toString());
    image = json['image'];
    sliderTarget = SliderTarget.values.firstWhere((element) => element.name == json['sliderTarget']);
    value = json['value'];
    createdAt = json['createdAt'];
  }
  String getLocalAssetPath() {
    // Map mainCategoryId to specific image names
    switch (sliderId) {
      case 1:
        return 'assets/images/man1.png';
      case 2:
        return 'assets/images/man2.png';
      case 3:
        return 'assets/images/man3.png';
      default:
        return 'assets/images/default_category.png'; // A default image
    }
  }
}