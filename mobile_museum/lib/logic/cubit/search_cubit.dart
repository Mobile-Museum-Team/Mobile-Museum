import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState(progressBarActive: false));

  void startLoad() {
    var newState = SearchState(progressBarActive: true);
    emit(newState);
  }

  void stopLoad() {
    var newState = SearchState(progressBarActive: false);
    emit(newState);
  }

  void startLoadFilters() {
    var newState = SearchState(
        progressBarActive: state.progressBarActive,
        progressActiveFilters: true);
    emit(newState);
  }

  void stopLoadFilters() {
    var newState = SearchState(
        progressBarActive: state.progressBarActive,
        progressActiveFilters: false);
    newState.filtersView = true;
    emit(newState);
  }
}
