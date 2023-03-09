import 'package:bloc_score_and_text/screens/form_for_save_words_screen.dart';
import 'package:bloc_score_and_text/screens/list_and_score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/word_bloc.dart';
import 'blocs/bloc/word_bloc_observer.dart';

void main() {
  Bloc.observer = WordBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WordBloc>(
      create: (context) => WordBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          '/saveWord': (BuildContext context) => const SaveWordsScreen(),
          '/wordsList': (BuildContext context) => const ListAndScoreScreen(),
        },
        home: const SaveWordsScreen(),
      ),
    );
  }
}
