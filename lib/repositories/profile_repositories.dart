import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zoonMall/app_config.dart';
import 'package:zoonMall/data_model/profile_counters_response.dart';
import 'package:zoonMall/helpers/shared_value_helper.dart';

class ProfileRepository {
  Future<ProfileCountersResponse> getProfileCountersResponse() async {
    final response = await http.get(
      "${AppConfig.BASE_URL}/profile/counters/${user_id.value}",
      headers: {"Authorization": "Bearer ${access_token.value}"},
    );
    return profileCountersResponseFromJson(response.body);
  }
}
