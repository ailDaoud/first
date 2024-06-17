import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? fuser;
  String? femail;
  @override
  void initState() {
    super.initState();
    splashh();
  }

  splashh() async {
    await Future.delayed(const Duration(seconds: 3));
    /*Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));*/
    return context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.greenAccent,
          Colors.lightBlue,
          Colors.redAccent,
        ], end: Alignment.bottomLeft, begin: Alignment.topRight),
      ),
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           /* Center(
              child: CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: Icon(Icons.home),
                foregroundColor: Colors.blueAccent,
              ),
            ),*/
            SizedBox(
              height: 30,
            ),
            /*Center(
              child: Text(
                "JAM",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                   ),
              ),
            ),*/
            const SizedBox(
              height: 30,
            ),
          ]),
    );
  }
}
