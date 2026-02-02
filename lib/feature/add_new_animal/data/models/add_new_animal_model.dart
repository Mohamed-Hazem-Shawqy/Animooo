import 'dart:io';

import 'package:animooo/feature/add_new_animal/domain/entities/add_new_animal_entity.dart';
import 'package:dio/dio.dart';

class AddNewAnimalModel {
  final String animalName;
  final double animalPrice;
  final int? categoryId;
  final String description;
  final String image;

  AddNewAnimalModel({
    required this.animalName,
    required this.animalPrice,
    required this.description,
    required this.image,
    this.categoryId,
  });
  factory AddNewAnimalModel.fromJson(Map<String, dynamic> json) =>
      AddNewAnimalModel(
        animalName: json['animal_name'],
        animalPrice: json['animal_price'],
        description: json['animal_description'],
        image: json['animal_image'],
        categoryId: json['category_id'],
      );
  factory AddNewAnimalModel.fromEntity(AddNewAnimalEntity addNewAnimalEntity) =>
      AddNewAnimalModel(
        animalName: addNewAnimalEntity.animalName,
        animalPrice: addNewAnimalEntity.animalPrice,
        description: addNewAnimalEntity.description,
        image: addNewAnimalEntity.categoryImage,
      );

  AddNewAnimalEntity toEntity() => AddNewAnimalEntity(
    animalName: animalName,
    animalPrice: animalPrice,
    description: description,
    categoryImage: image,
  );
}

class AddNewAnimalRequestModel {
  final String animalName;
  final double animalPrice;
  final int categoryId;
  final String description;
  final File image;

  AddNewAnimalRequestModel({
    required this.animalName,
    required this.animalPrice,
    required this.categoryId,
    required this.description,
    required this.image,
  });
  FormData toMap() {
    return FormData.fromMap({
      "name": animalName,
      "price": animalPrice,
      "category_id": categoryId,
      "description": description,
      "image": MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      ),
    });
  }
}
