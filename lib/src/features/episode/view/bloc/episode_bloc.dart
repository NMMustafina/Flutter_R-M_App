import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/features/episode/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_app/src/features/episode/domain/repositories/episode_repository.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final IEpisodeRepository repository;

  EpisodeBloc(this.repository) : super(EpisodeLoading()) {
    on<FetchEpisodes>(_onFetchEpisodes);
  }

  Future<void> _onFetchEpisodes(
    FetchEpisodes event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(EpisodeLoading());
    try {
      final episodes = await repository.episodes();
      emit(EpisodeLoaded(episodes));
    } catch (e) {
      emit(EpisodeError('Failed to fetch episodes'));
    }
  }
}
