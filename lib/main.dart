import 'package:dmpcreative/generated/l10n.dart';
import 'package:dmpcreative/utility/Preferences.dart';
import 'package:dmpcreative/view/pages/Authpages/SignIn.dart';
import 'package:dmpcreative/view/pages/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/pages/Authpages/SignUp.dart';
late final PrefProvider preferencesInstance;
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

     SharedPreferences prefs = await SharedPreferences.getInstance();
         preferencesInstance = PrefProvider(prefs);
  runApp(
    
    
    MultiProvider(
    providers:[
        ChangeNotifierProvider(create: (_) => PrefProvider(prefs)),
    ],
    child: MyApp( prefs: prefs,)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required SharedPreferences prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(fontFamily: 'Cairo', scaffoldBackgroundColor: Colors.black),
      home:  
    context.watch<PrefProvider>().isLoggedIn() ? HomePage():SignIn(),
    );
  }
}
