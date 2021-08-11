import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/src/binding/init_binding.dart';
import 'package:flutter_pokemon_app/src/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.white),
        primarySwatch: Colors.cyan,
        accentColor: Colors.cyan[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
      ],
    );
  }
}
