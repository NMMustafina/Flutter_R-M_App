import 'package:rick_and_morty_app/src/core/network/network_client.dart';
import 'package:rick_and_morty_app/src/features/episode/data/models/episode_model.dart';
import 'package:rick_and_morty_app/src/features/episode/data/source/i_episode_source.dart';

class EpisodeSourceImpl implements IEpisodeSource {
  EpisodeSourceImpl(this._client);

  final NetworkClient _client;

  @override
  Future<List<EpisodeModel>> episodes() async {
    final result = await _client.dio.get('/episode');

    return (result.data['results'] as List)
        .map((json) => EpisodeModel.fromJson(json))
        .toList();
  }
}
