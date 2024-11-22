import 'package:rick_and_morty_app/src/features/character_details/data/source/i_character_details_source.dart';
import 'package:rick_and_morty_app/src/features/character_details/domain/entities/character_details_entity.dart';
import 'package:rick_and_morty_app/src/features/character_details/domain/repositories/character_details_repository.dart';
import 'dart:developer' as dev;

class CharacterDetailsRepositoryImpl implements ICharacterDetailsRepository {
  CharacterDetailsRepositoryImpl(this._source);

  final ICharacterDetailsSource _source;

  @override
  Future<CharacterDetailsEntity?> getCharacter(int id) async {
    try {
      final result = await _source.getCharacterDetails(id);
      return result.toEntity();
    } catch (e, s) {
      dev.log('Exception: ', error: e, stackTrace: s);
      return null;
    }
  }
}