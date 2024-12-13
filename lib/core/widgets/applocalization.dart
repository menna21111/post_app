import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Applocalization {
  final Locale? locale;

  Applocalization({required this.locale});

  static Applocalization? of(BuildContext context) {
    //transalte the itm where it needed
    return Localizations.of<Applocalization>(context, Applocalization);

    /// define the class resp for localization
  }

  static  LocalizationsDelegate<Applocalization> delegate =
      _AppLocalizationsDelegate();//define the delegate 
  late Map<String, String> _localizedstrings;
  Future<void> load() async {
    String jsonStringValues =
        await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(
        jsonStringValues); //flutter support json in any type map of string ,dynamic  andd you can convert it to map

    _localizedstrings =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedstrings[key] ?? '';
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<Applocalization> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<Applocalization> load(Locale locale) async {
    Applocalization localize = Applocalization(locale: locale);
    await localize.load();
    return localize;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Applocalization> old) {
    return false;
  }
}
