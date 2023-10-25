import 'package:firebase_core/firebase_core.dart';
import 'package:firebasedatabase/pages/rtdb_pages.dart';
import 'package:firebasedatabase/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        RtdbPages.id:(context)=> const RtdbPages(),
        HomePage.id:(context)=> const HomePage(),
      },
    );
  }
}
