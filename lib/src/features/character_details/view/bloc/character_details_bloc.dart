import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/features/character_details/domain/entities/character_details_entity.dart';
import 'package:rick_and_morty_app/src/features/character_details/domain/repositories/character_details_repository.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  final ICharacterDetailsRepository repository;

  CharacterDetailsBloc(this.repository) : super(CharacterDetailsLoading()) {
    on<FetchCharacterDetails>(_onFetchCharacterDetails);
  }

  Future<void> _onFetchCharacterDetails(
      FetchCharacterDetails event,
      Emitter<CharacterDetailsState> emit,
      ) async {
    emit(CharacterDetailsLoading());
    try {
      final character = await repository.getCharacter(event.id);
      if (character != null) {
        emit(CharacterDetailsLoaded(character));
      } else {
        emit(CharacterDetailsError('Character not found'));
      }
    } catch (e) {
      emit(CharacterDetailsError('Failed to fetch character'));
    }
  }
}
