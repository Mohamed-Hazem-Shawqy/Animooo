import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;

  const SignupEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    phone,
    image,
  ];
}
