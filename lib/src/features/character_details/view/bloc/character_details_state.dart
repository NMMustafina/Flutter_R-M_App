part of 'character_details_bloc.dart';

abstract class CharacterDetailsState {}

class CharacterDetailsLoading extends CharacterDetailsState {}

class CharacterDetailsLoaded extends CharacterDetailsState {
  final CharacterDetailsEntity character;

  CharacterDetailsLoaded(this.character);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CharacterDetailsLoaded &&
              runtimeType == other.runtimeType &&
              character == other.character;

  @override
  int get hashCode => character.hashCode;
}

class CharacterDetailsError extends CharacterDetailsState {
  final String message;

  CharacterDetailsError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CharacterDetailsError &&
              runtimeType == other.runtimeType &&
              message == other.message;

  @override
  int get hashCode => message.hashCode;
}
