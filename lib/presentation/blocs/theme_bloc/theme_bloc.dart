import 'package:chatgpt/config/theme/themedata.dart';
import 'package:chatgpt/data/repositories/theme_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeRepository themeRepository = ThemeRepository();

  ThemeBloc() : super(ThemeInitialState()) {
    on<LoadTheme>((event, emit) {
      emit(ThemeLoadedState(
          themeData: themeRepository.loadTheme() ? darkTheme() : lightTheme()));
    });

    on<ChangeTheme>((event, emit) {
      emit(ThemeLoadedState(themeData: event.themeData));
      themeRepository.changeTheme();
    });
  }
}
