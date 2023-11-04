import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quail_farming/core/blocs/theme/theme_bloc.dart';
import 'package:quail_farming/core/services/injection_container.dart';
import 'package:quail_farming/core/services/navigation.dart';
import 'package:quail_farming/core/services/router.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: getIt<ThemeBloc>(),
      builder: (context, themeState) {
        return BlocBuilder<LcaBloc, L>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
              navigatorKey: getIt<Navigation>().navigatorKey,
              onGenerateRoute: generateRoute,
              theme: state.themeData,
              locale: state.locale,
              localizationsDelegates: localizations,
              supportedLocales: languages,
            );
          },
        );
      },
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text("sadf"),
    );
  }
}
