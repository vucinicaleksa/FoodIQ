import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenFoodFactsService {
  static Future<Map<String, dynamic>?> fetchProduct(String barcode) async {
    final url = Uri.parse(
      'https://world.openfoodfacts.org/api/v0/product/$barcode.json',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 1) {
        final product = data['product'];
        final nutriments = product['nutriments'];

        return {
          'name': product['product_name'] ?? 'Unknown product',
          'calories': nutriments['energy-kcal_100g'] ?? 0,
          'proteins': nutriments['proteins_100g'] ?? 0,
          'fats': nutriments['fat_100g'] ?? 0,
          'carbs': nutriments['carbohydrates_100g'] ?? 0,
        };
      }
    }
    return null;
  }
}
