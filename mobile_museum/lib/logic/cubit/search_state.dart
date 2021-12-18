part of 'search_cubit.dart';

class SearchState {
  bool progressBarActive;
  bool progressActiveFilters;
  bool filtersView = false;

  SearchState(
      {required this.progressBarActive, this.progressActiveFilters = false});
}
