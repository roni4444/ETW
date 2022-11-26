import 'package:flutter/material.dart';

import 'package:etw/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // listTileTheme: const ListTileThemeData(
        //   iconColor: Colors.blue,
        // ),
      ),
      themeMode: ThemeMode.dark,
      title: 'ETW',
      home: const HomePage(),
    );
  }
}
