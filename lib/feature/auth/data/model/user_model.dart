import 'dart:io';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String phone;

  @JsonKey(name: "image_path")
  final String image;

  const UserResponseModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,

    required this.image,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

  factory UserResponseModel.fromEntity(UserEntity entity) {
    return UserResponseModel(
      firstName: entity.firstName??'',
      lastName: entity.lastName??"",
      email: entity.email??'',
      phone: entity.phone??"",

      image: entity.image??"",
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,

      image: image,
    );
  }
}

// dart run build_runner build --delete-conflicting-outputs
class UserRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  final File image;
  const UserRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,

    required this.image,
    required this.password,
  });

  FormData toMap() {
    return FormData.fromMap({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "image": MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      ),
    });
  }
}
