import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/character_details_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: const Text('Character Details')),
      body: BlocProvider(
        create: (context) => context.read<CharacterDetailsBloc>()
          ..add(FetchCharacterDetails(characterId)),
        child: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
          builder: (context, state) {
            if (state is CharacterDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterDetailsLoaded) {
              final character = state.character;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        character.image,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      character.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Status: ${character.status}'),
                    Text('Species: ${character.species}'),
                    Text('Gender: ${character.gender}'),
                    const SizedBox(height: 16),
                    Text(
                      'Origin: ${character.origin.name}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Location: ${character.location.name}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Episodes: ${character.episode.length}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            } else if (state is CharacterDetailsError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Unexpected state'));
          },
        ),
      ),
    );
  }
}
