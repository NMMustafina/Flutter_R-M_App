import '../entities/episode_entity.dart';

abstract interface class IEpisodeRepository {
  Future<List<EpisodeEntity>> episodes();
}
