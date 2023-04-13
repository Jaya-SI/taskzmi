import 'package:taskzmi/common/shared_code.dart';
import 'package:taskzmi/model/dashboard/add_tiket_model.dart';
import 'package:taskzmi/model/dashboard/get_tiket_model.dart';
import 'package:taskzmi/repositories/dashboard/base_dashboard_repositories.dart';
import 'package:http/http.dart' as http;

class DashboardRepository implements BaseDashboardRepository {
  @override
  Future<GetTiketModel> getTiket() async {
    final response =
        await http.get(Uri.parse('${SharedCode.baseUrl}/api/event'));

    final getTiket = getTiketModelFromJson(response.body);

    if (response.statusCode == 200) {
      return getTiket;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<AddTiketModel> addTiket(
      {required String name,
      required String price,
      required String qty}) async {
    Map<String, dynamic> data = {
      'name': name,
      'id_event': '24',
      'id_variant': '7',
      'start_date': '2022-09-04',
      'start_time': '08:00',
      'end_date': '2022-09-04',
      'end_time': '10:00',
      'price': price,
      'qty': qty,
    };
    final response = await http.post(
      Uri.parse('${SharedCode.baseUrl}/api/ticket'),
      body: data,
    );

    final addTiket = addTiketModelFromJson(response.body);

    if (response.statusCode == 200) {
      return addTiket;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
