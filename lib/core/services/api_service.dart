import 'package:http/http.dart' as http;
import 'package:quran_app/core/constant/app_links.dart';
import 'package:quran_app/model/azkar_model.dart';

class ApiService {
  static Future<List<AzkarModel>> getAllAzkar() async {
    try {
      final response = await http.get(Uri.parse(AppLinks.adhkar));

      if (response.statusCode == 200) {
        final azkarList = AzkarModel.listFromRawJson(response.body);
        // log(azkarList[1].category.toString());
        return azkarList;
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
