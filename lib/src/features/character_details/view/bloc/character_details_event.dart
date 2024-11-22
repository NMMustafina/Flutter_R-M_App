part of 'character_details_bloc.dart';

abstract class CharacterDetailsEvent {}

class FetchCharacterDetails extends CharacterDetailsEvent {
  final int id;

  FetchCharacterDetails(this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FetchCharacterDetails &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
