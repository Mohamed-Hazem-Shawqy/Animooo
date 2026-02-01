import 'package:animooo/feature/category/domain/entities/get_all_category_entity.dart';

class GetAllCategoryModel {
  final String name;
  final String image;
  final String description;

  GetAllCategoryModel({
    required this.name,
    required this.image,
    required this.description,
  });

  factory GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetAllCategoryModel(
      name: json['name'],
      image: json['imagePath'],
      description: json['description'],
    );
  }
  factory GetAllCategoryModel.fromEntity(GetAllCategoryEntity entity) {
    return GetAllCategoryModel(
      name: entity.name,
      image: entity.image,
      description: entity.description,
    );
  }

  GetAllCategoryEntity toEntity(){
    return GetAllCategoryEntity(
      name: name,
      image: image,
      description: description,
    );
  }
}
