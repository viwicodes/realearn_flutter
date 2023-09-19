import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relearn/pages/homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Relearn Flutter',
    home: HomeScreen(),
  ));
}
