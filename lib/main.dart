import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter pack',
      theme: ThemeData(
        accentColor: color_blue_dark,
        canvasColor: color_white,
      ),
      initialRoute: RouteGenerator.SPLASH_ROUTE,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      // localisation
      supportedLocales: const <Locale>[
        Locale('en','UK'),
      ],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
      ],
      localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales){
        for(final Locale supportedLocale in supportedLocales) {
          if(supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
