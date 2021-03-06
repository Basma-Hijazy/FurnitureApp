import 'package:http/http.dart' as http;
import 'package:zoonMall/app_config.dart';
import 'package:zoonMall/data_model/category_response.dart';

class CategoryRepository {
  Future<CategoryResponse> getCategories({parent_id = 0}) async {
    final response = await http
        .get("${AppConfig.BASE_URL}/categories?parent_id=${parent_id}");
    return categoryResponseFromJson(response.body);
  }

  Future<CategoryResponse> getFeturedCategories() async {
    final response =
        await http.get("${AppConfig.BASE_URL}/categories/featured");
    return categoryResponseFromJson(response.body);
  }

  Future<CategoryResponse> getTopCategories() async {
    final response = await http.get("${AppConfig.BASE_URL}/categories/top");
    return categoryResponseFromJson(response.body);
  }

  Future<CategoryResponse> getFilterPageCategories() async {
    final response = await http.get("${AppConfig.BASE_URL}/filter/categories");
    return categoryResponseFromJson(response.body);
  }
}
