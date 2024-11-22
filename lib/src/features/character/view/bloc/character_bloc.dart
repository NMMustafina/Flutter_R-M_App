import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/features/character/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/src/features/character/domain/repositories/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ICharacterRepository repository;

  CharacterBloc(this.repository) : super(CharacterLoading()) {
    on<FetchCharacters>(_onFetchCharacters);
  }

  Future<void> _onFetchCharacters(
    FetchCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading());
    try {
      final characters = await repository.characters();
      emit(CharacterLoaded(characters));
    } catch (e) {
      emit(CharacterError('Failed to fetch characters'));
    }
  }
}
