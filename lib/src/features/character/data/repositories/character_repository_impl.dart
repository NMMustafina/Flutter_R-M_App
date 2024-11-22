import 'package:rick_and_morty_app/src/features/character/data/source/i_character_source.dart';
import 'package:rick_and_morty_app/src/features/character/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/src/features/character/domain/repositories/character_repository.dart';
import 'dart:developer' as dev;

class CharacterRepositoryImpl implements ICharacterRepository {
  CharacterRepositoryImpl(this._source);

  final ICharacterSource _source;

  @override
  Future<List<CharacterEntity>> characters() async {
    try {
      final result = await _source.characters();
      return result.map((e) => e.toEntity()).toList();
    } catch (e, s) {
      dev.log('Exception: ', error: e, stackTrace: s);
      return <CharacterEntity>[];
    }
  }
}
