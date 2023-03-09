part of 'word_bloc.dart';

class WordState extends Equatable {
  final List<Word> allWords;
  const WordState({
    this.allWords = const <Word>[],
  });

  List<Object> get props => [];
}
