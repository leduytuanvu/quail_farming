import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quail_farming/core/enums/enums.dart';
import 'package:quail_farming/core/services/shared.dart';
import 'package:quail_farming/core/theme/theme.dart' as theme;

part 'theme_event.dart';
part 'theme_state.dart';

// ThemeBloc handles changing the app's theme.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final Shared _shared;

  // Constructor takes an instance of Shared to persist theme changes.
  ThemeBloc(this._shared)
      : super(ThemeState(
          themeData: _shared.getTheme() == EnumTheme.light.name
              ? theme.Theme.lightTheme
              : theme.Theme.darkTheme,
        )) {
    on<ChangeThemeEvent>(_changeThemeHandler);
  }

  // Handler for when the theme is changed.
  Future<void> _changeThemeHandler(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeState(
      themeData: event.theme == EnumTheme.light.name
          ? theme.Theme.lightTheme
          : theme.Theme.darkTheme,
    ));
    // Persist the theme change.
    await _shared.setTheme(event.theme);
  }
}
