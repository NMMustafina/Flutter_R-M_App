class EpisodeEntity {
  EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
  });

  final int id;
  final String name;
  final String airDate;

  @override
  bool operator ==(Object other) =>
      other is EpisodeEntity &&
          id == other.id &&
          name == other.name &&
          airDate == other.airDate;

  @override
  int get hashCode => Object.hash(id, name, airDate);
}
