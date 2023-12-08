import 'package:demandeconge/View/home_demande_conge.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const d_grey = const Color(0xFF999999);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('fr_FR', null);
  tzdata.initializeTimeZones();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demande de congés',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      locale: Locale('fr', 'FR'),
      supportedLocales: [
        const Locale('fr', 'FR'),
        const Locale('en', 'US'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // Ajoutez d'autres délégués de localisation si nécessaire
      ],
      home: HomeDemandeConge(),
    );
  }
}
