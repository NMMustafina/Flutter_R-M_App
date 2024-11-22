import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/di.dart';
import 'package:rick_and_morty_app/src/features/character/view/bloc/character_bloc.dart';
import 'src/di.dart' as di;
import 'src/features/character/view/character_list_screen.dart';

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharacterBloc(sl())..add(FetchCharacters()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharacterListScreen(),
      ),
    );
  }
}
