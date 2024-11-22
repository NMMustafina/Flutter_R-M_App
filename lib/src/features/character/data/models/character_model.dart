import 'package:rick_and_morty_app/src/features/character/domain/entities/character_entity.dart';

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  CharacterEntity toEntity() {
    return CharacterEntity(id: id, name: name, image: image);
  }
}
