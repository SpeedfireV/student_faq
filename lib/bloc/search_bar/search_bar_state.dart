part of 'search_bar_cubit.dart';

@immutable
sealed class SearchBarState {
  final String query;
  const SearchBarState(this.query);
}

final class SearchBarInitial extends SearchBarState {
  const SearchBarInitial(super.query);

}

class SearchBarStateResults extends SearchBarState {

  const SearchBarStateResults(super.query);
}

class SearchBarStateQueryChanged extends SearchBarState {
  const SearchBarStateQueryChanged(super.query);
}