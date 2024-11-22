part of 'character_bloc.dart';

abstract class CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> characters;

  CharacterLoaded(this.characters);
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);
}
