import 'package:bloc_score_and_text/components/menu.dart';
import 'package:bloc_score_and_text/models/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import '../blocs/bloc/word_bloc.dart';

class SaveWordsScreen extends StatefulWidget {
  const SaveWordsScreen({super.key});

  @override
  State<SaveWordsScreen> createState() => _SaveWordsScreenState();
}

class _SaveWordsScreenState extends State<SaveWordsScreen> {
  String? _wordName;
  bool isWordInTheList = false;
  TextEditingController wordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordBloc, WordState>(
      builder: (context, state) {
        return Scaffold(
          endDrawer: const Menu(),
          drawerEdgeDragWidth: 0,
          backgroundColor: const Color(0xffd7deff),
          appBar: AppBar(title: const Text('Score And Text - Add new word')),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _wordName ?? '',
                    style: TextStyle(
                      fontSize: 42,
                      color: isWordInTheList ? Colors.white : Colors.blue,
                      backgroundColor:
                          isWordInTheList ? Colors.red : Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                    ],
                    controller: wordInputController,
                    decoration:
                        const InputDecoration(labelText: 'Type a valid word'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      child: const Icon(Icons.save, color: Colors.white),
                      onPressed: () async {
                        var result = await checkWordInWordsList(
                            context, wordInputController.text);
                        if (result != null) {
                          isWordInTheList = true;
                        } else {
                          var word = Word(wordInputController.text,
                              wordInputController.text.length);
                          if (mounted) {
                            isWordInTheList = false;
                            await addWordToLIst(context, word);
                          }
                        }
                        setState(
                          () {
                            _wordName = wordInputController.text;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<Word?> checkWordInWordsList(
      BuildContext context, String wordname) async {
    var wordList = context.read<WordBloc>().state.allWords;
    var foundWord = wordList.firstWhereOrNull((word) => word.name == wordname);
    return foundWord;
  }

  Future<void> addWordToLIst(BuildContext context, Word word) async {
    context.read<WordBloc>().add(AddWord(word: word));
  }
}
