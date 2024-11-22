import 'package:rick_and_morty_app/src/features/episode/domain/entities/episode_entity.dart';

class EpisodeModel {
  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
  });

  final int id;
  final String name;
  final String airDate;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
    );
  }

  EpisodeEntity toEntity() {
    return EpisodeEntity(id: id, name: name, airDate: airDate);
  }
}
