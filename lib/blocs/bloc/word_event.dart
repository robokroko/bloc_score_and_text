part of 'word_bloc.dart';

abstract class WordEvent extends Equatable {
  const WordEvent();

  List<Object> get props => [];
}

class AddWord extends WordEvent {
  final Word word;
  const AddWord({required this.word});

  @override
  List<Object> get props => [];
}
