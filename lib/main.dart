import 'package:flutter/material.dart';
import 'package:login/loginPage.dart';

void main() {
  runApp(myApp());
}

var assetsImage = AssetImage("assets/xpertLoginBackground.jpg");
var image = Image(
  image: assetsImage,
  fit: BoxFit.cover,
  width: double.infinity,
  height: double.infinity,
);

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Mini SFA app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        
      ),
      home: Loginpage(),
    );
  }
}