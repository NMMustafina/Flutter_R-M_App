import 'package:rick_and_morty_app/src/core/network/network_client.dart';
import 'package:rick_and_morty_app/src/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/src/features/character/data/source/i_character_source.dart';

class CharacterSourceImpl implements ICharacterSource {
  CharacterSourceImpl(this._client);

  final NetworkClient _client;

  @override
  Future<List<CharacterModel>> characters() async {
    final result = await _client.dio.get('/character');

    return (result.data['results'] as List)
        .map((json) => CharacterModel.fromJson(json))
        .toList();
  }
}
