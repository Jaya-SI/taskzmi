import 'package:taskzmi/common/shared_code.dart';
import 'package:taskzmi/model/auth/login_model.dart';
import 'package:taskzmi/model/auth/register_model.dart';
import 'package:taskzmi/repositories/auth/base_auth_repositories.dart';
import 'package:http/http.dart' as http;

class AuthRepository implements BaseAuthRepository {
  @override
  Future<RegisterModel> register(
      String name, String email, String password, String phone) async {
    Map<String, dynamic> data = {
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
    };

    final response = await http.post(
      Uri.parse('${SharedCode.baseUrl}/api/register'),
      body: data,
    );

    final register = registerModelFromJson(response.body);

    if (response.statusCode == 200) {
      return register;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<LoginModel> login(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse('${SharedCode.baseUrl}/api/login'),
      body: data,
    );

    final login = loginModelFromJson(response.body);

    if (response.statusCode == 200) {
      return login;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
