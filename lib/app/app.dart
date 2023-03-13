import 'package:flutter/material.dart';
import 'package:step_1/views/home_views.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomeView(),
    );
  }
}
