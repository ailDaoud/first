import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_task2/Model/Categoriesmodel.dart';
import 'package:first_task2/Model/SubCategorymodel.dart';
import 'package:first_task2/Model/trendymodel.dart';
import 'package:first_task2/main.dart';
import 'package:http/http.dart' as http;


const baseurl = 'https://asp-enjoyed-bonefish.ngrok-free.app';
const baseurl2 = 'https://jamfurniture.000webhostapp.com';

class ContantRep {
  Future<List<Category>> fetchcategories() async {
    Dio dio = Dio();
    try {
      var response = await dio.get('$baseurl2/api/category/index');
   // var response=await http.get(Uri.parse('$baseurl2/api/category/index'));
      GetCategory getCategory = GetCategory.fromJson(response.data);
      List<Category> category = getCategory.categories.toList();
      print(response.data);
      print("(((((((((((((99)))))))))))))");
      return category;
    } on DioException catch (e) {
      return [];
    }
  }

  Future<List<Datum>> fetchtrendypro() async {
    Dio dio = Dio();
    try {
      var response = await dio.get('$baseurl2/api/product/trendy');
      GetTrendy getTrendy = GetTrendy.fromJson(response.data);
      List<Datum> trendy = getTrendy.products.data.toList();
      print(response.data);
      print("(((((((((((((88)))))))))))))");
      return trendy;
    } on DioException catch (e) {
      return [];
    }
  }
  Future<List<SubCat>> fetchsubproducy() async {
    int? id= sharedPreferences!.getInt("catid");
    Dio dio = Dio();
    try {
      var response = await dio.get('$baseurl2/api/category/show/$id');
      GetSubproduct getSubproduct = GetSubproduct.fromJson(response.data);
      List<SubCat> trendy = getSubproduct.products.data.toList();
      print(response.data);
      print("(((((((((((((77)))))))))))))");
      return trendy;
    } on DioException catch (e) {
      return [];
    }
  }
}
