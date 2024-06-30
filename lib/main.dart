import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_pro/pages/home-page.dart';
import 'package:search_pro/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThemeProvider();
      },
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Search App',
          theme: provider.theme,
          home: Homepage(),
        );
      },
    );
  }
}
