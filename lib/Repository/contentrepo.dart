import 'package:dio/dio.dart';
import 'package:first_task2/Model/Categoriesmodel.dart';
import 'package:first_task2/Model/SubCategorymodel.dart';
import 'package:first_task2/Model/trendymodel.dart';
import 'package:first_task2/main.dart';

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

      return trendy;
    } on DioException catch (e) {
      return [];
    }
  }

  Future<List<SubCat>> fetchsubcategory() async {
    int? id = sharedPreferences!.getInt("catid");
    print(id);
    print("@@@!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    Dio dio = Dio();
    try {
      var response = await dio.get('$baseurl2/api/category/show/$id');
      GetSubproduct getSubproduct = GetSubproduct.fromJson(response.data);
      List<SubCat> subcat = getSubproduct.products.data.toList();
      print(response.data);
      print("(((((((((((((55)))))))))))))");
      return subcat;
    } on DioException catch (e) {
      return [];
    }
  }
}
