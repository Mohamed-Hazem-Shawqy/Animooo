import 'package:animooo/core/entity/get_all_animal_entity.dart';

class GetAllAnimalModel {
  final String name;
  final String image;
  final String description;
  final int categoryid;
  final double price;

  GetAllAnimalModel({
    required this.name,
    required this.description,
    required this.image,
    required this.categoryid,
    required this.price,
  });

  GetAllAnimalEntity toEntity() {
    return GetAllAnimalEntity(
      name: name,
      description: description,
      image: image,
      categoryid: categoryid,
      price: price,
    );
  }

  factory GetAllAnimalModel.fromJson(Map<String, dynamic> json) {
    return GetAllAnimalModel(
      name: json['animal_name'],
      description: json['animal_description'],
      image: json['animal_image'],
      categoryid: json['category_id'],
      price: json['animal_price'],
    );
  }
}
