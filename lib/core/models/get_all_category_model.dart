import 'package:animooo/core/entity/get_all_category_entity.dart';

class GetAllCategoryModel {
  final String name;
  final String image;
  final String description;
  final int id;

  GetAllCategoryModel({
    required this.name,
    required this.image,
    required this.description,
    required this.id,
  });

  factory GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetAllCategoryModel(
      name: json['name'],
      image: json['imagePath'],
      description: json['description'],
      id: json['id'],
    );
  }
  factory GetAllCategoryModel.fromEntity(GetAllCategoryEntity entity) {
    return GetAllCategoryModel(
      name: entity.name,
      image: entity.image,
      description: entity.description,
      id: entity.id,
    );
  }

  GetAllCategoryEntity toEntity() {
    return GetAllCategoryEntity(
      name: name,
      image: image,
      description: description,
      id: id,
    );
  }
}
