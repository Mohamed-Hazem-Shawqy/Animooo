import 'package:animooo/feature/otp/domain/entities/otp_entity.dart';

class OtpModel {
  final String email;

  final String? firstName;
  final String? lastName;
  final String? phone;

  final String? imagePath;

  final String? isVerified;

  final String? refreshToken;

  final String? accessToken;

  OtpModel({
    required this.email,
     this.firstName,
     this.lastName,
     this.phone,
     this.imagePath,
     this.isVerified,
    this.refreshToken,
    this.accessToken,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] as Map<String, dynamic>;

    return OtpModel(
      email: userData['email'] as String,
      firstName: userData['first_name'] as String,
      lastName: userData['last_name'] as String,
      phone: userData['phone'] as String,
      imagePath: userData['image_path'] as String,
      isVerified: userData['is_verified']  as String, 
      accessToken: json['access_token'] as String?, 
      refreshToken: json['refresh_token'] as String?, 
    );
  }

  OtpEntity toEntity() => OtpEntity(email: email);
  factory OtpModel.fromEntity(OtpEntity entity) => OtpModel(email: entity.email);
}

class OtpRequestModel {
  final String email;
  final String code;

  OtpRequestModel({required this.email, required this.code});

  Map<String, dynamic> toJson() {
    return {"email": email, "code": code};
  }
}
