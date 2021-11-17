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
    return MaterialApp(title: 'Midterm App', home: const HomeScreen(), routes: {
      AddScreen.routeName: (ctx) => const AddScreen(),
      DetailsScreen.routeName: (ctx) => const DetailsScreen(),
      EditScreen.routeName: (ctx) => const EditScreen(),
    });
  }
}
