import 'package:get_it/get_it.dart';
import 'package:quail_farming/core/blocs/theme/theme_bloc.dart';
import 'package:quail_farming/core/services/navigation.dart';
import 'package:quail_farming/core/services/shared.dart';
import 'package:quail_farming/core/utils/global_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjector() async {
  final shared = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => Shared(shared));

  getIt.registerSingleton<Navigation>(Navigation());
  getIt.registerSingleton<GlobalData>(GlobalData());

  getIt.registerLazySingleton(() => ThemeBloc(getIt()));
}
