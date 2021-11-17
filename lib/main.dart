import 'package:flutter/material.dart';
import 'presentation/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Midterm App', home: HomeScreen(), routes: {
      AddScreen.routeName: (ctx) => AddScreen(),
      DetailsScreen.routeName: (ctx) => DetailsScreen(),
      EditScreen.routeName: (ctx) => EditScreen(),
    });
  }
}
