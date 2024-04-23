import 'package:first_task2/Home.dart';
//import 'package:first_task2/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    splashh();
  }
  splashh()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "")));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("First splash" ,style: TextStyle(color: Colors.amber[600],fontSize: 40),),),
    );
  }
}