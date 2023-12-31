part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  const ChangeThemeEvent({required this.theme});

  final String theme;

  @override
  List<Object?> get props => [theme];
}
