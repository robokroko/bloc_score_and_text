import 'package:bloc_score_and_text/components/menu.dart';
import 'package:bloc_score_and_text/models/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/word_bloc.dart';

class ListAndScoreScreen extends StatefulWidget {
  const ListAndScoreScreen({super.key});

  static const routeName = '/wordsList';

  @override
  State<ListAndScoreScreen> createState() => _ListAndScoreScreenState();
}

class _ListAndScoreScreenState extends State<ListAndScoreScreen> {
  List<Word>? wordList = [];
  int finalScore = 0;

  @override
  Widget build(BuildContext context) {
    calculateScore();
    return BlocBuilder<WordBloc, WordState>(
      builder: (context, state) {
        List<Word> wordList = state.allWords;
        return Scaffold(
          endDrawer: const Menu(),
          backgroundColor: const Color(0xffd7deff),
          appBar: AppBar(title: const Text('Score And Text - Add new word')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total Score:',
                style: TextStyle(fontSize: 42),
              ),
              Text(
                finalScore.toString(),
                style: const TextStyle(fontSize: 42),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: wordList.length,
                    itemBuilder: (context, index) {
                      var word = wordList[index];
                      return ListTile(
                        title: Text(word.name!),
                        trailing: Text(word.score.toString()),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }

  void calculateScore() {
    var wordList = context.read<WordBloc>().state.allWords;
    for (var word in wordList) {
      finalScore = finalScore + word.score!;
    }
  }
}
