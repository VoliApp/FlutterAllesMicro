import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voli/preferences.dart';
import 'package:voli/theming.dart';
import 'package:voli/views/home.dart';
import 'package:voli/views/login.dart';

import 'loginData.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => LoginProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        child: Consumer<LoginProvider>(
            builder: (context, provider, _) =>
                provider.isLoggedIn ? Home() : Login()),
        builder: (context, provider, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Voli',
            theme: provider.get(false),
            darkTheme: provider.get(true),
            themeMode: provider.theme == 0
                ? ThemeMode.system
                : provider.theme == 1
                    ? ThemeMode.light
                    : ThemeMode.dark,
            home: child));
  }
}
