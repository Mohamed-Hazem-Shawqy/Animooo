import 'package:equatable/equatable.dart';

class GetAllCategoryEntity extends Equatable {
  final String name;
  final String description;
  final String image;
  final int? id;

  const GetAllCategoryEntity({required this.name, required this.description, required this.image,  this.id});
  @override
  List<Object?> get props => [name, description, image,id];
}