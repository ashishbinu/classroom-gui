import 'package:http/http.dart' as http;
import '../models/classroom.dart';

class RemoteServices {
  static http.Client client = http.Client();

  static Future<ClassRoom> fetchSubjects() async {
    const String _url = 'https://api.mocki.io/v1/a82511ca';
    final response = await client.get(_url);
    if (response.statusCode == 200) {
      return ClassRoom.fromRawJson(response.body);
    } else {
      throw Exception("failed to load data");
    }
  }
}
