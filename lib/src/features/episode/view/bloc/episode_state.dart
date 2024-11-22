part of 'episode_bloc.dart';

abstract class EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<EpisodeEntity> episodes;

  EpisodeLoaded(this.episodes);
}

class EpisodeError extends EpisodeState {
  final String message;

  EpisodeError(this.message);
}
