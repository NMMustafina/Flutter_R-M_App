import 'package:rick_and_morty_app/src/features/episode/data/source/i_episode_source.dart';
import 'package:rick_and_morty_app/src/features/episode/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_app/src/features/episode/domain/repositories/episode_repository.dart';
import 'dart:developer' as dev;

class EpisodeRepositoryImpl implements IEpisodeRepository {
  EpisodeRepositoryImpl(this._source);

  final IEpisodeSource _source;

  @override
  Future<List<EpisodeEntity>> episodes() async {
    try {
      final result = await _source.episodes();
      return result.map((e) => e.toEntity()).toList();
    } catch (e, s) {
      dev.log('Exception: ', error: e, stackTrace: s);
      return <EpisodeEntity>[];
    }
  }
}
