import 'package:animooo/feature/auth/domain/entities/signin_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_signin_model.g.dart';

@JsonSerializable()
class UserSigninModel {
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String phone;

  @JsonKey(name: "image_path")
  final String image;
  UserSigninModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.image,
  });

  factory UserSigninModel.fromJson(Map<String, dynamic> json) =>_$UserSigninModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSigninModelToJson(this);

  SigninEntity toEntity(){
    return SigninEntity(email: email);
  }
      
}
