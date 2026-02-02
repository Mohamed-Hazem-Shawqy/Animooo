import 'package:equatable/equatable.dart';

class AddNewAnimalEntity extends Equatable {
  final String animalName;
  final String description;
  final double animalPrice;
  final String categoryImage;

  const AddNewAnimalEntity({
    required this.animalName,
    required this.description,
    required this.animalPrice,
    required this.categoryImage,
  });
  @override
  List<Object?> get props => [
    animalName,
    description,
    animalPrice,
    categoryImage,
  ];
}
