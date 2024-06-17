import 'package:first_task2/Screen/Login/bloc/login_bloc.dart';
import 'package:first_task2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordconfirm = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    passwordconfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text("Login Page"),
          ),
          body: BlocConsumer<LoginBloc, LoginState>(
            listenWhen: (previous, current) => current is SucsessLogin,
            buildWhen: (previous, current) => current is SucsessLogin,
            listener: (context, state) {
              if (state is SucsessLogin) {
                return context.go('/verify');
              } else {
                print("&&&&&&&&&&&&&&&&&&&&&&");
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _header(context),
                    Form(
                      child: TextFormField(
                        cursorColor: Colors.blueGrey,
                        keyboardType: TextInputType.number,
                        controller: name,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusColor: Colors.amber,
                            hoverColor: Colors.black,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            fillColor: Colors.blueAccent,
                            hintText: "Enter your Name",
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Form(
                      child: TextFormField(
                        cursorColor: Colors.blueGrey,
                        keyboardType: TextInputType.number,
                        controller: email,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusColor: Colors.amber,
                            hoverColor: Colors.black,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            fillColor: Colors.blueAccent,
                            hintText: "Enter your email",
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Form(
                      child: TextFormField(
                        cursorColor: Colors.blueGrey,
                        keyboardType: TextInputType.number,
                        controller: password,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusColor: Colors.amber,
                            hoverColor: Colors.black,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            fillColor: Colors.blueAccent,
                            hintText: "Enter your password",
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Form(
                      child: TextFormField(
                        cursorColor: Colors.blueGrey,
                        keyboardType: TextInputType.number,
                        controller: passwordconfirm,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusColor: Colors.amber,
                            hoverColor: Colors.black,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            fillColor: Colors.blueAccent,
                            hintText: "confirm password",
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          return context.go('/home');
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Colors.grey),
                        )),
                    MaterialButton(
                        child: Container(
                          color: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                        onPressed: () async {
                          BlocProvider.of<LoginBloc>(context).add(StartLogin(
                              email: email.text,
                              name: name.text,
                              password: password.text,
                              password_confrmation: passwordconfirm.text));

                          sharedPreferences!.setString("name", name.text);
                          sharedPreferences!.setString("email", email.text);
                          sharedPreferences!
                              .setString("password", password.text);
                          sharedPreferences!.setString(
                              "passwordconfirm", passwordconfirm.text);
                        })
                  ],
                ),
              );
            },
          )),
    );
  }
}

_header(context) {
  return const Column(
    children: [
      Text(
        "Welcome To JAM",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(
        "Fill The Form",
        style: TextStyle(fontSize: 12),
      ),
    ],
  );
}
