import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? image;

  const UserEntity({
     this.firstName,
     this.lastName,
     this.email,
     this.phone,
     this.image,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, phone, image];
}
