import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relearn/pages/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Relearn Flutter',
    home: HomeScreen(),
  ));
}
