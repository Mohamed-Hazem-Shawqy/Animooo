// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSigninModel _$UserSigninModelFromJson(Map<String, dynamic> json) =>
    UserSigninModel(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      image: json['image_path'] as String,
    );

Map<String, dynamic> _$UserSigninModelToJson(UserSigninModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'image_path': instance.image,
    };
