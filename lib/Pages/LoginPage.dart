import 'package:first_task2/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username=TextEditingController();
  final TextEditingController useremail=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: username,
            decoration:const InputDecoration(
              hintText: "Enter your name",
                border: UnderlineInputBorder(
                  
                    borderSide: BorderSide(color: Colors.black))),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: useremail,
            decoration: const InputDecoration(
              hintText: "Enter your email",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(child: Container(padding: EdgeInsets.symmetric(horizontal: 40),child: Text("Login"),),onPressed: ()async {
           final SharedPreferences sh=await SharedPreferences.getInstance();
           sh.setString("username", username.text);
           sh.setString("email", useremail.text);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
          })
        ],
      ),
    );
  }
}