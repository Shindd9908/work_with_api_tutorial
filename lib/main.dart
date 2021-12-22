import 'package:flutter/material.dart';
import 'package:the_movie_db/screens/vn/provices_vn.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const ProvicesVietNam(),
    );
  }
}
