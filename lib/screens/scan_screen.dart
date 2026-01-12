import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScanScreen extends StatefulWidget {
  final String? barcode;

  const ScanScreen({super.key, this.barcode});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Map<String, dynamic>? product;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    if (widget.barcode != null) {
      fetchProduct(widget.barcode!);
    }
  }

  Future<void> fetchProduct(String code) async {
    setState(() => loading = true);

    final url =
        'https://world.openfoodfacts.org/api/v0/product/$code.json';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data['status'] == 1) {
      setState(() {
        product = data['product'];
      });
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Proizvod')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : product == null
              ? const Center(child: Text('Proizvod nije pronađen'))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!['product_name'] ?? 'Nepoznato',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Kalorije: ${product!['nutriments']?['energy-kcal_100g'] ?? '-'} kcal'),
                      Text('Proteini: ${product!['nutriments']?['proteins_100g'] ?? '-'} g'),
                      Text('Masti: ${product!['nutriments']?['fat_100g'] ?? '-'} g'),
                      Text('Ugljikohidrati: ${product!['nutriments']?['carbohydrates_100g'] ?? '-'} g'),
                    ],
                  ),
                ),
    );
  }
}
