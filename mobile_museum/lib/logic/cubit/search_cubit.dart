import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  void startLoad() {
    state.progressBarActive = true;
  }

  void stopLoad() {
    state.progressBarActive = false;
  }
}
