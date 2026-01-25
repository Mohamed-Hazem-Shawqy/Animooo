import 'package:animooo/feature/new_password/domain/entity/create_new_password_entity.dart';

class CreateNewPasswordModel {
  final String? message;
  final String? accessToken;
  final String? refreshToken;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  CreateNewPasswordModel({
    this.message,
    this.accessToken,
    this.refreshToken,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory CreateNewPasswordModel.fromJson(Map<String, dynamic> json) {
    return CreateNewPasswordModel(
      message: json['message'] ?? '',
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
      phone: json['user']['phone'],
    );
  }

  CreateNewPasswordEntity toEntity() => CreateNewPasswordEntity(
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
  );
  factory CreateNewPasswordModel.fromEntity(CreateNewPasswordEntity entity) =>
      CreateNewPasswordModel(
        firstName: entity.firstName,
        lastName: entity.lastName,
        email: entity.email,
        phone: entity.phone,
      );
}

class CreateNewPasswordRequestModel {
  final String email;
  final String password;
  final String confirmPassword;

  CreateNewPasswordRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };
}
