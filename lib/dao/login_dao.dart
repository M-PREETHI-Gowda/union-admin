import 'dart:convert';
import 'dart:developer';
import 'package:admin_app/components/config.dart';
import 'package:http/http.dart' as http;

class LoginDao {
  Future login({required String memberId, required String password}) async {
    var url = '${Config.url}/admin/auth/login';

    Map<String,dynamic> body = {
      "member_id": memberId,
      "password": password
    };

    final response = await http.post(
        Uri.parse(url),
        headers: Config.headers(),
        body: jsonEncode(body)
    );

    log("Response Status Code : ${response.statusCode}");
    log("Response body : ${response.body}");

    return response;
  }

}