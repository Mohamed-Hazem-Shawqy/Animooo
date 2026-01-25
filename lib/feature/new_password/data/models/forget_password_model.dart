import 'package:animooo/feature/new_password/domain/entity/forget_password_entity.dart';

class ForgetPasswordModel {
  final String? email;
  final String? message;

  ForgetPasswordModel({ this.message, this.email});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(message: json['message'] ?? '');
  }

  Map<String, dynamic> toJson() => {"email": email};

  ForgetPasswordEntity toEntity() => ForgetPasswordEntity(email: email ?? '');
  factory ForgetPasswordModel.fromEntity(ForgetPasswordEntity entity) =>
      ForgetPasswordModel(message: '', email: entity.email);
}
