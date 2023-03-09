import 'package:bloc/bloc.dart';
import 'package:bloc_score_and_text/models/word.dart';
import 'package:equatable/equatable.dart';

part 'word_event.dart';
part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  WordBloc() : super(const WordState()) {
    on<AddWord>(_onAddWord);
  }

  void _onAddWord(AddWord event, Emitter<WordState> emit) {
    final state = this.state;
    emit(WordState(
      allWords: List.from(state.allWords)..add(event.word),
    ));
  }
}
