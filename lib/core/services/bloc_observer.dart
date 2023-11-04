import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quail_farming/core/services/logger.dart';

class BlocObservers extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Logger.info('Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger.info('Event: $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.error('Error: $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger.info('Transition: $transition');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Logger.info('Closed: ${bloc.runtimeType}');
  }
}
