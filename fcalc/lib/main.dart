import 'package:fcalc/db.dart' as db;
import 'package:fcalc/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io' show Platform;

import 'db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
        center: true,
        size: Size(900, 450),
        titleBarStyle: TitleBarStyle.normal);
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setAspectRatio(1 / 2);
    });
  }
  final dbInstance = await db.init();
  runApp(MyApp(db: dbInstance));
}

class MyApp extends StatelessWidget {
  final Database db;
  const MyApp({required this.db, super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        dbProv.overrideWith((ref) => db),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
