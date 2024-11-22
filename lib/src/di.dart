import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/src/core/network/network_client.dart';
import 'package:rick_and_morty_app/src/features/character/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/src/features/character/data/source/character_remote_source.dart';
import 'package:rick_and_morty_app/src/features/character/data/source/i_character_source.dart';
import 'package:rick_and_morty_app/src/features/character/domain/repositories/character_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<NetworkClient>(() => NetworkClient());
  sl.registerLazySingleton<ICharacterSource>(() => CharacterSourceImpl(sl()));
  sl.registerLazySingleton<ICharacterRepository>(
      () => CharacterRepositoryImpl(sl()));
}
