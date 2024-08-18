abstract class HomeEvent {}

class HomeEventInit extends HomeEvent {}

class HomeEventVote extends HomeEvent {
  final bool value;

  HomeEventVote({required this.value});
}