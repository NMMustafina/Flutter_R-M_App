import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/episode_bloc.dart';

class EpisodeListScreen extends StatelessWidget {
  const EpisodeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty Episodes')),
      body: BlocBuilder<EpisodeBloc, EpisodeState>(
        builder: (context, state) {
          if (state is EpisodeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EpisodeLoaded) {
            return ListView.builder(
              itemCount: state.episodes.length,
              itemBuilder: (context, index) {
                final episode = state.episodes[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Text(episode.airDate),
                    title: Text(episode.name),
                  ),
                );
              },
            );
          } else if (state is EpisodeError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Unexpected state'));
        },
      ),
    );
  }
}
