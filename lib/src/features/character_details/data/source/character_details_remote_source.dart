import 'package:rick_and_morty_app/src/core/network/network_client.dart';
import 'package:rick_and_morty_app/src/features/character_details/data/models/character_details_model.dart';
import 'package:rick_and_morty_app/src/features/character_details/data/source/i_character_details_source.dart';

class CharacterDetailsSourceImpl implements ICharacterDetailsSource {
  CharacterDetailsSourceImpl(this._client);

  final NetworkClient _client;

  @override
  Future<CharacterDetailsModel> getCharacterDetails(int id) async {
    final result = await _client.dio.get('/character/$id');

    return CharacterDetailsModel.fromJson(result.data);
  }
}
