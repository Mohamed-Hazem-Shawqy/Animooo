import 'package:animooo/feature/otp/domain/entities/otp_entity.dart';

class SendNewOtpCode {
  final String email;

  final String? accessToken;

  SendNewOtpCode({required this.email, this.accessToken});

  factory SendNewOtpCode.fromJson(Map<String, dynamic> json) => SendNewOtpCode(
    email: json["user"]["email"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {"email": email};
  factory SendNewOtpCode.fromEntity(OtpEntity otpEntity) =>
      SendNewOtpCode(email: otpEntity.email);

  OtpEntity toEntity() => OtpEntity(email: email);
}
