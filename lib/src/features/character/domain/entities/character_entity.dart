class CharacterEntity {
  CharacterEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  @override
  bool operator ==(Object other) =>
      other is CharacterEntity &&
      id == other.id &&
      name == other.name &&
      image == other.image;

  @override
  int get hashCode => Object.hash(id, name, image);
}
