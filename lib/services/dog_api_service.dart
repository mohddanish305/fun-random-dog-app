import 'dart:convert';
import 'package:http/http.dart' as http;

class DogApiService {
  static Future<String> fetchDogImage() async {
    final response =
    await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    final data = jsonDecode(response.body);
    return data['message'];
  }
}
