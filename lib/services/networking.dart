import 'dart:convert';
import 'package:http/http.dart' as Http;

//ส่วนของการเรียกใช้งาน api
class NetworkHelper {
  Future getData(String apiPath) async {
      try {
        var url = apiPath;
        Http.Response response = await Http
            .get(Uri.parse(url))
            .timeout(const Duration(seconds: 60));
        if (response.statusCode == 200) {
          String data = response.body;

          return jsonDecode(data);
        } else {
          String data = response.body;
          return jsonDecode(data);
        }
      } catch (e) {
        print(e);
      }
    }
}

