import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeview.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
        useMaterial3: true,
      ),
      home: const HomeView(),
    ); 
  }
}