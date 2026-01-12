import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const _apiKey = 'AIzaSyCH2eLnYB35NNONTU3BXjEMPX0Ks5U4a68';

  static const _apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent';

  static Future<String> ask(String question) async {
    final prompt = """
You are a professional nutritionist and dietary expert. 
Answer all questions in English. 
Provide structured and concise answers. 
Focus on calories, proteins, fats, carbohydrates, healthy eating, weight loss, or muscle gain if applicable.
User question: "$question"
""";

    try {
      final response = await http.post(
        Uri.parse("$_apiUrl?key=$_apiKey"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt},
              ],
            },
          ],
          "generationConfig": {"temperature": 0.7, "maxOutputTokens": 1500},
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          return data['candidates'][0]['content']['parts'][0]['text'];
        }
        return "AI nije vratio odgovor.";
      } else {
        return "Greška: ${response.statusCode}\n${response.body}";
      }
    } catch (e) {
      return "Došlo je do greške u povezivanju: $e";
    }
  }
}
