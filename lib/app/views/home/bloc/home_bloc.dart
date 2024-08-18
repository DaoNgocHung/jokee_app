import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokee_app/app/core/constant/app_constant.dart';
import 'package:jokee_app/app/core/data/local/share_preference_key.dart';
import 'package:jokee_app/app/core/data/local/sqflite_storage.dart';
import 'package:jokee_app/app/core/data/model/joke.dart';
import 'package:jokee_app/app/views/home/bloc/home_event.dart';
import 'package:jokee_app/app/views/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEventInit>(_init);
    on<HomeEventVote>(_vote);
  }


  Future<void> _init(HomeEventInit event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<Joke> jokes = await SqfliteStorage.instance.fetchJokes();

    if(jokes.isEmpty) {
      for (var joke in AppConstant.sampleJokes) {
        await SqfliteStorage.instance.insertJoke(joke);
      }
    }

    final currentIndex = SharedPreference.getInt(SharedPreferenceKeys.currentIndexKey, 0);

    if(currentIndex >= AppConstant.sampleJokes.length) {
      emit(state.copyWith(
        isLoading: false,
        isComeBackLater: true,
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: false,
      currentIndex: currentIndex,
      isComeBackLater: false,
      joke: AppConstant.sampleJokes[currentIndex].content,
    ));
  }

  Future<void> _vote(HomeEventVote event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isVoteLoading: true));
    final joke = AppConstant.sampleJokes[state.currentIndex];
    joke.isFunny = event.value;
    await SqfliteStorage.instance.updateJoke(joke);
    int nextIndex = state.currentIndex + 1;
    _saveCurrentIndex(nextIndex);
    if(nextIndex < AppConstant.sampleJokes.length) {
      emit(state.copyWith(
        isVoteLoading: false,
        joke: AppConstant.sampleJokes[nextIndex].content,
        currentIndex: nextIndex,
        isComeBackLater: false,
      ));
    } else {
      emit(state.copyWith(isVoteLoading: false, isComeBackLater: true));
    }
  }

  Future<void> _saveCurrentIndex(int currentIndex) async {
    await SharedPreference.setInt(SharedPreferenceKeys.currentIndexKey, currentIndex);
  }
}
