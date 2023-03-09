import 'package:bloc_score_and_text/blocs/bloc/word_bloc.dart';
import 'package:bloc_score_and_text/blocs/bloc_exports.dart';
import 'package:bloc_score_and_text/models/word.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:collection/collection.dart';

// Mock Bloc
class MockWordBloc extends MockBloc<WordEvent, WordState> implements WordBloc {}

void main() {
  var expectedResult = <Word>[];

  setUp(() {});
  blocTest(
    'emits [StateB] when EventB is added',
    build: () => WordBloc(),
    act: (bloc) => bloc.add(AddWord(word: Word('name', 4))),
    expect: () => [
      WordState(allWords: expectedResult),
    ],
  );

  test('addWordToLIst', () {
    List<Word>? wordList = [];

    void addWordToLIst(Word word) {
      wordList.add(word);
    }

    addWordToLIst(Word('name', 4));

    expect(wordList.isEmpty, false);
  });

  test('checkWordInWordsListWithfalse', () {
    Word? foundWord;
    Future<Word?> checkWordInWordsList(String wordname) async {
      var wordList = [Word('noteszt', 7)];
      foundWord = wordList.firstWhereOrNull((word) => word.name == wordname);
      return foundWord;
    }

    checkWordInWordsList('teszt');

    expectLater(foundWord, null);
  });

  test('calculateScore', () {
    List<Word>? wordList = [Word('teszt', 5), Word('tesztecske', 10)];
    int? finalScore = 0;
    void calculateScore() {
      for (var word in wordList) {
        finalScore = finalScore! + word.score!;
      }
    }

    calculateScore();

    expect(finalScore, 15);
  });
}
