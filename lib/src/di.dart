import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/src/core/network/network_client.dart';
import 'package:rick_and_morty_app/src/features/character/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/src/features/character/data/source/character_remote_source.dart';
import 'package:rick_and_morty_app/src/features/character/data/source/i_character_source.dart';
import 'package:rick_and_morty_app/src/features/character/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/src/features/episode/data/repositories/episode_repository_impl.dart';
import 'package:rick_and_morty_app/src/features/episode/data/source/episode_remote_source.dart';
import 'package:rick_and_morty_app/src/features/episode/data/source/i_episode_source.dart';
import 'package:rick_and_morty_app/src/features/episode/domain/repositories/episode_repository.dart';

import 'features/character_details/data/repositories/character_details_repository_impl.dart';
import 'features/character_details/data/source/character_details_remote_source.dart';
import 'features/character_details/data/source/i_character_details_source.dart';
import 'features/character_details/domain/repositories/character_details_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<NetworkClient>(() => NetworkClient());

  // Character Module
  sl.registerLazySingleton<ICharacterSource>(() => CharacterSourceImpl(sl()));
  sl.registerLazySingleton<ICharacterRepository>(() => CharacterRepositoryImpl(sl()));

  // Character Details Module
  sl.registerLazySingleton<ICharacterDetailsSource>(() => CharacterDetailsSourceImpl(sl()));
  sl.registerLazySingleton<ICharacterDetailsRepository>(() => CharacterDetailsRepositoryImpl(sl()));

  // Episode Module
  sl.registerLazySingleton<IEpisodeSource>(() => EpisodeSourceImpl(sl()));
  sl.registerLazySingleton<IEpisodeRepository>(() => EpisodeRepositoryImpl(sl()));
}
