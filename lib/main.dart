import 'package:flutter/material.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:flutter_components_app/src/pages/home_page.dart';
import 'package:flutter_components_app/src/pages/alert_page.dart';
// import 'package:flutter_components_app/src/pages/avatar_page.dart';
import 'package:flutter_components_app/src/routes/routes.dart';
// import 'package:flutter_components_app/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Components App',
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   const Locale('en', ''), // English, no country code
        //   // const Locale('es', ''), // Spanish, no country code
        // ],
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.light,
        ),
        // home: HomePageTemp());
        // home: HomePage());
        initialRoute: '/',
        routes: getApplicationRoutes(),
        onGenerateRoute: (settings) =>
            MaterialPageRoute(builder: (context) => AlertPage()));
  }
}
