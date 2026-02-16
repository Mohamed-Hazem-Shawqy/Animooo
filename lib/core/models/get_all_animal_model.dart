import 'package:animooo/core/entity/get_all_animal_entity.dart';

class GetAllAnimalModel {
  final String name;
  final String image;
  final String description;
  final int categoryid;
  final int animalid;
  final double price;

  GetAllAnimalModel({
    required this.name,
    required this.description,
    required this.image,
    required this.categoryid,
    required this.price, required this.animalid,
  });

  GetAllAnimalEntity toEntity() {
    return GetAllAnimalEntity(
      name: name,
      description: description,
      image: image,
      categoryid: categoryid,
      price: price,
      animalid: animalid,
    );
  }

  factory GetAllAnimalModel.fromJson(Map<String, dynamic> json) {
    return GetAllAnimalModel(
      name: json['animal_name'],
      description: json['animal_description'],
      image: json['animal_image'],
      categoryid: json['category_id'],
      price: json['animal_price'], animalid: json['animal_id'],
    );
  }
}
