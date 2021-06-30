import 'package:http/http.dart' as http;
import 'package:zoonMall/app_config.dart';
import 'package:zoonMall/data_model/slider_response.dart';

class SlidersRepository {
  Future<SliderResponse> getSliders() async {
    final response = await http.get("${AppConfig.BASE_URL}/sliders");
    return sliderResponseFromJson(response.body);
  }
}
