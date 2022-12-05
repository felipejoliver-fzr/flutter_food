import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Tes teste teste';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      title: _title,
      initialRoute: '/',
    );
  }
}
