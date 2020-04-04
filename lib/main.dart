import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color orange = _colorFromHex("#ff9800"); /* Main background color */
    Color darkGrey = _colorFromHex("#333333"); /* Main menu color */
    return MaterialApp(
      title: 'Interclip',
      theme: ThemeData(
        primaryColor: darkGrey,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        backgroundColor: orange,
          appBar: AppBar(title: Text('Interclip mobile')),
          body: Center(
            child: (
              Text("lol")
            )
          ),
          ),
    );
    
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
