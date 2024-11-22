class CharacterDetailsEntity {
  CharacterDetailsEntity({
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
  final OriginEntity origin;
  final LocationEntity location;
  final List<String> episode;
  final String url;
  final DateTime created;

  @override
  bool operator ==(Object other) =>
      other is CharacterDetailsEntity &&
          id == other.id &&
          name == other.name &&
          image == other.image &&
          status == other.status &&
          species == other.species &&
          gender == other.gender &&
          type == other.type &&
          origin == other.origin &&
          location == other.location &&
          episode.length == other.episode.length &&
          episode.every((e) => other.episode.contains(e)) &&
          url == other.url &&
          created == other.created;

  @override
  int get hashCode => Object.hash(
    id,
    name,
    image,
    status,
    species,
    gender,
    type,
    origin,
    location,
    Object.hashAll(episode),
    url,
    created,
  );
}

class OriginEntity {
  OriginEntity({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  bool operator ==(Object other) =>
      other is OriginEntity && name == other.name && url == other.url;

  @override
  int get hashCode => Object.hash(name, url);
}

class LocationEntity {
  LocationEntity({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  bool operator ==(Object other) =>
      other is LocationEntity && name == other.name && url == other.url;

  @override
  int get hashCode => Object.hash(name, url);
}
