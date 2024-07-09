import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class TimbuApiService {
  static const String apiKey =
      '7a66eded2090437e80eab559b5243aeb20240709162209937023';
  static const String appId = 'QJYEE8E2USWEGUY';
  static const String organizationId = '5f7d30c0216549d484bf2e87f357ec4f';
  static const String baseUrl = 'https://api.timbu.cloud/products';

  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse(
        '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey');
    // print('Fetching products from URL: $url');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print('Response received: ${response.body}');
      try {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('items')) {
          List<dynamic> items = jsonResponse['items'];
          List<Product> products =
              items.map((dynamic item) => Product.fromJson(item)).toList();
          return products;
        } else {
          // print('Error: JSON response does not contain "items" key');
          throw Exception('Failed to parse products');
        }
      } catch (e) {
        // print('Error parsing JSON: $e');
        throw Exception('Failed to parse products');
      }
    } else {
      // print(
          // 'Failed to load products: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load products');
    }
  }
}
