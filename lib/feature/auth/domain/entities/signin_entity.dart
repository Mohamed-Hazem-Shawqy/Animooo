import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String email;

  const SigninEntity({required this.email});
  @override
  List<Object?> get props => [email];
}
