import 'package:equatable/equatable.dart';

class GetAllAnimalEntity extends Equatable {
  final String name;
  final String image;
  final String description;
  final int? categoryid;
  final int? animalid;
  final double price;

  const GetAllAnimalEntity({
    required this.name,
    required this.image,
    required this.description,
     this.categoryid,
    required this.price, this.animalid,
  });
  @override
  List<Object?> get props => [name, image, description, categoryid, price,animalid];
}
