import 'package:rick_and_morty_app/src/features/character_details/data/models/character_details_model.dart';

abstract interface class ICharacterDetailsSource {
  Future<CharacterDetailsModel> getCharacterDetails(int id);
}
