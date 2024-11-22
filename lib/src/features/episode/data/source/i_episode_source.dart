import 'package:rick_and_morty_app/src/features/episode/data/models/episode_model.dart';

abstract interface class IEpisodeSource {
  Future<List<EpisodeModel>> episodes();
}
