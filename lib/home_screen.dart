import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/scan_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'widgets/daily_summary_widget.dart';
import 'widgets/today_products_list.dart';
import 'widgets/calories_chart.dart';
import 'widgets/goal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _barcodeController = TextEditingController();

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void _searchManually() {
    final code = _barcodeController.text.trim();
    if (code.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ScanScreen(barcode: code)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodIQ'),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔹 DAILY SUMMARY
            const DailySummaryWidget(),

            const SizedBox(height: 12),

            // 🔹 GOAL
            const GoalWidget(),

            const SizedBox(height: 20),
            const Divider(),

            // 🔹 MANUAL BARCODE INPUT
            const Text(
              'Enter barcode manually',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _barcodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. 737628064502',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: _searchManually,
              child: const Text('Search product'),
            ),

            const SizedBox(height: 16),

            // 🔹 SCAN BARCODE
            ElevatedButton.icon(
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Scan barcode'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BarcodeScannerScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            const Divider(),

            // 🔹 TODAY PRODUCTS LIST (EDIT / DELETE)
            const Text(
              'Today products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const TodayProductsList(),

            const SizedBox(height: 20),
            const Divider(),

            // 🔹 CHART
            const Text(
              'Calories (last 7 days)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const CaloriesChart(),
          ],
        ),
      ),
    );
  }
}
