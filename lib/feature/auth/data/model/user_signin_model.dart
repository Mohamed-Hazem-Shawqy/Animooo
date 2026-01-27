import 'package:animooo/feature/auth/domain/entities/signin_entity.dart';

class UserSigninModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final String? accessToken;
  final String? refreshToken;
  UserSigninModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.image,
    this.accessToken,
    this.refreshToken,
  });
  factory UserSigninModel.fromJson(Map<String, dynamic> json) {
    return UserSigninModel(
      email: json['user']['email'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      phone: json['user']['phone'],
      image: json['user']['image_path'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "image": image,
    };
  }

  SigninEntity toEntity() {
    return SigninEntity(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      image: image,
    );
  }

  factory UserSigninModel.fromEntity(SigninEntity signinEntity) {
    return UserSigninModel(
      email: signinEntity.email,
      firstName: signinEntity.firstName ?? '',
      lastName: signinEntity.lastName ?? '',
      phone: signinEntity.phone ?? '',
      image: signinEntity.image ?? '',
    );
  }
}
