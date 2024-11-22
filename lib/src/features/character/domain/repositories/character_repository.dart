import '../entities/character_entity.dart';

abstract interface class ICharacterRepository {
  Future<List<CharacterEntity>> characters();
}
