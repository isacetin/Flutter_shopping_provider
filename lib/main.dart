import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uygulama_yapisi/shoppingProvider.dart';
import 'AppController.dart';
import 'UI/home_page.dart';

void main() {
  runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider<AppController>(
      create: (_) => AppController(),
    ),
    ChangeNotifierProvider<Shoping>(
      create: (_) => Shoping(),
    ),
  ]));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<AppController>().getTheme() == true
          ? ThemeData.dark()
          : ThemeData.light(),
      home: MyHomePage(),
    );
  }
}
