import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:first_task2/Screen/Login/bloc/login_bloc.dart';
import 'package:first_task2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Varify extends StatefulWidget {
  const Varify({super.key});

  @override
  State<Varify> createState() => _VarifyState();
}

class _VarifyState extends State<Varify> {
  final OtpFieldController otpController = OtpFieldController();
  final TextEditingController otp = TextEditingController();
  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Varify"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              Form(
                child: 
                OTPTextField(
                      keyboardType: TextInputType.number,
                      controller: otpController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {},
                      onCompleted: (pin) {
                        sharedPreferences!.setString("code", pin);
                      }),/*TextFormField(
                  cursorColor: Colors.blueGrey,
                  keyboardType: TextInputType.number,
                  controller: otp,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusColor: Colors.amber,
                      hoverColor: Colors.black,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      fillColor: Colors.blueAccent,
                      hintText: "Enter your Name",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          borderSide: BorderSide(color: Colors.black))),
                ),*/
              ),
              MaterialButton(
                  child: Container(
                    color: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      "send otp",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  onPressed: () async {
                    var c = sharedPreferences!.getString("email");
                    BlocProvider.of<LoginBloc>(context)
                        .add(StartVerify(email: c!, otp: otpController.toString()));
                   
                  })
            ],
          );
        },
     //   listenWhen: (previous, current) => current is SucsessVarify,
        buildWhen: (previous, current) => current is FailerVarify,
        listener: (context, state) {
          if (state is SucsessVarify) {
            return context.go('/home');
          } else if(state is FailerVarify) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.infoReverse,
              headerAnimationLoop: true,
              animType: AnimType.bottomSlide,
              title: 'Something wrong',
              reverseBtnOrder: true,
              btnOkOnPress: () {},
              btnCancelOnPress: () {},
              desc: 'Wrong otp',
            ).show();
          }
        },
      ),
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
        "Enter otp code",
        style: TextStyle(fontSize: 12),
      ),
    ],
  );
}

