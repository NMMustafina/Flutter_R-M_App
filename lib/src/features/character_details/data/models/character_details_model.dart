import 'package:rick_and_morty_app/src/features/character_details/domain/entities/character_details_entity.dart';

class CharacterDetailsModel {
  CharacterDetailsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.type,
    required this.origin,
    required this.location,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final String type;
  final OriginModel origin;
  final LocationModel location;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) {
    return CharacterDetailsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      type: json['type'] ?? '',
      origin: OriginModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }

  CharacterDetailsEntity toEntity() {
    return CharacterDetailsEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: OriginEntity(
        name: origin.name,
        url: origin.url,
      ),
      location: LocationEntity(
        name: location.name,
        url: location.url,
      ),
      image: image,
      episode: List<String>.from(episode),
      url: url,
      created: created,
    );
  }

}

class OriginModel {
  OriginModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
      name: json['name'],
      url: json['url'],
    );
  }
}

class LocationModel {
  LocationModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
