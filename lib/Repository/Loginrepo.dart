import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_task2/main.dart';

const String baseurl = 'https://asp-enjoyed-bonefish.ngrok-free.app/api/auth/';
const baseurl2 = 'https://jamfurniture.000webhostapp.com';

class Auth {
  static Future<bool> register(String name, String email, String password,
      String password_confrmation) async {
    var dio = Dio();

    var a = sharedPreferences!.getString("name");
    var b = sharedPreferences!.getString("email");
    var c = sharedPreferences!.getString("password");
    var e = sharedPreferences!.getString("passwordconfirm");
    var d = {"name": a, "email": b, "password": c, "password_confirmation": e};

    try {
      var secondRespons = await dio.post(
        '$baseurl2/api/auth/register',
        data: jsonEncode(d),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      if (secondRespons.statusCode == 200 && secondRespons.statusCode! < 300) {
        if (secondRespons.data["status"] == "success") {
          sharedPreferences?.setString(
              "token", secondRespons.data["access_token"]);
          print(sharedPreferences?.getString("token"));

          return true;
        } else {
          print("error in email");
          return false;
        }
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e.message);
      return false;
    }
  }

  static Future<bool> setotp(String email, String otp) async {
    var dio = Dio();
    var email = sharedPreferences?.getString("email");
    var otp = sharedPreferences?.getString("code");
    var d = {"code": otp, "email": email};
    try {
      var thirdresponse = await dio.post(
        '$baseurl2/api/auth/verify-user-email',
        data: jsonEncode(d),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (thirdresponse.statusCode == 200 || thirdresponse.statusCode! < 305) {
        if (thirdresponse.data["status"] == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
