import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Localization {
  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  static const supportedLocales = [
    Locale('en', 'US'), // English
    Locale('es', 'ES'), // Spanish
    // Add other supported locales
  ];

  Iterable<LocalizationsDelegate<dynamic>>? localizations = const [
    LocalizationDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello': 'Hello',
      'welcome': 'Welcome',
    },
    'vi': {
      'hello': 'Xin chào',
      'welcome': 'Bienvenido',
    },
  };

  String get hello {
    return _localizedValues[locale.languageCode]!['hello']!;
  }

  String get welcome {
    return _localizedValues[locale.languageCode]!['welcome']!;
  }
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}
