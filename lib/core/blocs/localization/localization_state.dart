part of 'localization_bloc.dart';

abstract class LocalizationState extends Equatable {
  const LocalizationState();
}

class LocalizationInitial extends LocalizationState {
  @override
  List<Object> get props => [];
}
