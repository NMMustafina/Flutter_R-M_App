import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/character_bloc.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty Characters')),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(character.image),
                    title: Text(character.name),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/character-details',
                        arguments: character.id,
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is CharacterError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Unexpected state'));
        },
      ),
    );
  }
}
