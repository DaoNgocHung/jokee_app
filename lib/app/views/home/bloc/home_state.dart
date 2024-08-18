class HomeState {
  final bool isLoading;
  final String joke;
  final bool isComeBackLater;
  final int currentIndex;
  final bool isVoteLoading;

  HomeState({
    this.isLoading = false,
    this.joke = "",
    this.isComeBackLater = false,
    this.currentIndex = 0,
    this.isVoteLoading = false,
  });

  HomeState copyWith({bool? isLoading, String? joke, bool? isComeBackLater, int? currentIndex, bool? isVoteLoading}) {
    return HomeState(
      joke: joke ?? this.joke,
      isLoading: isLoading ?? this.isLoading,
      isComeBackLater: isComeBackLater ?? this.isComeBackLater,
      currentIndex: currentIndex ?? this.currentIndex,
      isVoteLoading: isVoteLoading ?? this.isVoteLoading,
    );
  }
}
