import 'package:equatable/equatable.dart';

 class OtpEntity extends Equatable {
  final String email;
  
  const OtpEntity({required this.email});

  @override
  List<Object?> get props => [email];
}