import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color orange = _colorFromHex("#ff9800"); /* Main background color */
    Color darkGrey = _colorFromHex("#333333"); /* Main menu color */
    String textCode = "";
    String patttern = r'(([a-z]|[1-9]){5})';
    RegExp regExp = new RegExp(patttern);
    print("yees");
    return MaterialApp(
      title: 'Interclip',
      theme: ThemeData(
          primaryColor: darkGrey,
          secondaryHeaderColor: orange,
          brightness: Brightness.light,
          backgroundColor: orange),
      darkTheme: ThemeData(
          primaryColor: darkGrey,
          backgroundColor: darkGrey,
          brightness: Brightness.dark),
      home: Scaffold(
          backgroundColor: orange,
          appBar: AppBar(title: Text('Interclip mobile')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //   Text("First line"),
              //   Text("second line lmao"),
              TextFormField(
                  onChanged: (text) {
                    textCode = text;
                    if(textCode.length == 5 && regExp.hasMatch(textCode)) {
                      print(textCode);
                    }
                  },
                  autocorrect: false,
                  autofocus: true,
                  maxLength: 5,
                  maxLengthEnforced: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter username.';
                    } else if (value.length > 5) {
                      return 'Code too long';
                    } else {
                      return validateMyInput(value);
                    }
                  },
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Your code',
                    helperText: 'A five digit code from Interclip'
                  ),
                  style: TextStyle(
                    fontSize: 120,
                  )),
                
            ],
          )),
    );
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

Future<bool> isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

String validateMyInput(String value) {
  Pattern pattern = r'^\d+(?:\.\d+)?$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Number';
  else
    return null;
}
