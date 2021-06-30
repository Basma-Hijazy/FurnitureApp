import 'package:http/http.dart' as http;
import 'package:zoonMall/app_config.dart';
import 'package:zoonMall/data_model/flash_deal_response.dart';

class FlashDealRepository {
  Future<FlashDealResponse> getFlashDeals() async {
    final response = await http.get("${AppConfig.BASE_URL}/flash-deals");
    return flashDealResponseFromJson(response.body);
  }
}
