import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? image;

  const SigninEntity({required this.email,  this.firstName,  this.lastName,  this.phone,  this.image});
  @override
  List<Object?> get props => [email, firstName, lastName, phone,image];
}
