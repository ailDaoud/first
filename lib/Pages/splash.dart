import 'package:first_task2/Pages/Home.dart';
import 'package:first_task2/Pages/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Check().whenComplete(
      () async {
        if (fuser == null && femail == null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        } else {
          splashh();
        }
      },
    );
  }

  splashh() async {
    /*BlocProvider(
      create: (context) => Bloc(),
      child: Container(),
    );*/
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  Future Check() async {
    final SharedPreferences sh = await SharedPreferences.getInstance();
    var userch = sh.getString("username");
    var emailch = sh.getString("email");
    setState(() {
      fuser = userch;
      femail = emailch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "First splash",
                style: TextStyle(
                  color: Colors.amber[600],
                  fontSize: 40,
                ),
              ),
            ),
            Center(
              child: const CircularProgressIndicator(
                color: Colors.amber,
                backgroundColor: Colors.white,
              ),
            )
          ]),
    );
  }
}
