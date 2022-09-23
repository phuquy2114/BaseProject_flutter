import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base/di/locator.dart';
import 'main_viewmodel.dart';
import 'pages/home_page.dart';

void main() {
  setUpInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<MainVM>(create: (_) => MainVM())],
      child: MaterialApp(
        title: 'FULL API - RETROFIT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'FETCH API RETROFIT - DIO'),
      ),
    );
  }
}
