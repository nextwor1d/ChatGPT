part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitialState extends ThemeState {}

final class ThemeLoadedState extends ThemeState {
  final ThemeData themeData;

  const ThemeLoadedState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}
