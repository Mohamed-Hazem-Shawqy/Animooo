import 'package:equatable/equatable.dart';

class CreateNewCategoryEntity extends Equatable {
  final String name;
  final String description;
  final String imagepath;

  const CreateNewCategoryEntity({
    required this.name,
    required this.description,
    required this.imagepath,
  });
  @override
  List<Object?> get props => [name, description, imagepath];
}
