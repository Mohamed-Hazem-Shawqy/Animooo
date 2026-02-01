import 'dart:io';

import 'package:animooo/feature/category/domain/entities/create_new_category_entity.dart';
import 'package:dio/dio.dart';

class CreatNewCategoryModel {
  final String name;
  final String image;
  final String description;

  CreatNewCategoryModel({
    required this.name,
    required this.image,
    required this.description,
  });

  factory CreatNewCategoryModel.fromJson(Map<String, dynamic> json) {
    return CreatNewCategoryModel(
      name: json['Category']['name'],
      image: json['Category']['imagePath'],
      description: json['Category']['description'],
    );
  }

  factory CreatNewCategoryModel.fromEntity(CreateNewCategoryEntity entity) {
    return CreatNewCategoryModel(
      name: entity.name,
      image: entity.imagepath,
      description: entity.description,
    );
  }

  CreateNewCategoryEntity toEntity() {
    return CreateNewCategoryEntity(
      name: name,
      imagepath: image,
      description: description,
    );
  }
}

class CreateNewCategoryRequestModel {
  final String name;
  final File image;
  final String description;

  CreateNewCategoryRequestModel({
    required this.name,
    required this.image,
    required this.description,
  });
  FormData toJson() {
    return FormData.fromMap({
      "name": name,
      "image": MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      ),
      "description": description,
    });
  }
}
