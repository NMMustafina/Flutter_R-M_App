import '../entities/character_details_entity.dart';

abstract interface class ICharacterDetailsRepository {
  Future<CharacterDetailsEntity?> getCharacter(int id);
}
