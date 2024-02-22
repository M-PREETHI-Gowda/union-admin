import 'dart:developer';
import 'package:admin_app/components/config.dart';
import 'package:http/http.dart' as http;

class ProfileDao {
  Future fetchProfile() async {
    var url = '${Config.url}/admin/profile/view';

    final response = await http.get(
      Uri.parse(url),
      headers: Config.authHeaders(),
    );
    log("Response Status Code : ${response.statusCode}");
    log("Response body : ${response.body}");
    return response;
  }
}