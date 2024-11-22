import 'package:rick_and_morty_app/src/features/character/data/models/character_model.dart';

abstract interface class ICharacterSource {
  Future<List<CharacterModel>> characters();
}
