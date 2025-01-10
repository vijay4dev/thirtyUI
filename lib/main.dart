// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/databasefunction.dart';
import 'package:flutter_application_1/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple,
            titleTextStyle: TextStyle(
              // Style of the title text
              color: Colors.white, // Title text color
              fontSize: 20, // Title font size
              fontWeight: FontWeight.bold, // Title font weight
            ),
            iconTheme: IconThemeData(
              // Icon style for the AppBar
              color: Colors.white, // Icon color
              size: 24, // Icon size
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 15))),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DataBaseOption();
              } else {
                return Homepage();
              }
            }));
  }
}
