import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/src/di.dart' as di;
import 'package:rick_and_morty_app/src/features/character/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/src/features/character/view/character_list_screen.dart';
import 'package:rick_and_morty_app/src/features/character/view/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/src/features/character_details/domain/repositories/character_details_repository.dart';
import 'package:rick_and_morty_app/src/features/character_details/view/character_details_screen.dart';
import 'package:rick_and_morty_app/src/features/character_details/view/bloc/character_details_bloc.dart';

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ICharacterRepository>(
          create: (_) => di.sl<ICharacterRepository>(),
        ),
        Provider<ICharacterDetailsRepository>(
          create: (_) => di.sl<ICharacterDetailsRepository>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => BlocProvider(
            create: (context) =>
            CharacterBloc(context.read<ICharacterRepository>())
              ..add(FetchCharacters()),
            child: const CharacterListScreen(),
          ),
          '/character-details': (context) {
            final characterId =
            ModalRoute.of(context)!.settings.arguments as int;
            return BlocProvider(
              create: (context) => CharacterDetailsBloc(
                context.read<ICharacterDetailsRepository>(),
              )..add(FetchCharacterDetails(characterId)),
              child: const CharacterDetailsScreen(),
            );
          },
        },
      ),
    );
  }
}
