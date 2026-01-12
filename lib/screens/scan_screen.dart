import 'package:flutter/material.dart';
import '../services/open_food_facts_service.dart';

class ScanScreen extends StatefulWidget {
  final String barcode;

  const ScanScreen({super.key, required this.barcode});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Map<String, dynamic>? product;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    final data = await OpenFoodFactsService.fetchProduct(widget.barcode);
    setState(() {
      product = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product details')),
      body:
          loading
              ? const Center(child: CircularProgressIndicator())
              : product == null
              ? const Center(child: Text('Product not found'))
              : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product!['name'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text('Calories: ${product!['calories']} kcal'),
                    Text('Proteins: ${product!['proteins']} g'),
                    Text('Fats: ${product!['fats']} g'),
                    Text('Carbohydrates: ${product!['carbs']} g'),
                  ],
                ),
              ),
    );
  }
}
