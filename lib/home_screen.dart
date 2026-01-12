import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/scan_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'services/ai_question_widget.dart';
// widgets
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

  DateTime selectedDate = DateTime.now();

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void _searchManually() {
    final code = _barcodeController.text.trim();
    if (code.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScanScreen(barcode: code),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  String get formattedDate =>
      "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodIQ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 📅 DATE PICKER
            ElevatedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(formattedDate),
              onPressed: _pickDate,
            ),

            const SizedBox(height: 12),

            // 🔹 DAILY SUMMARY
            DailySummaryWidget(date: selectedDate),

            const SizedBox(height: 12),

            // 🔹 GOAL
            const GoalWidget(),
          
            const SizedBox(height: 20),
            const Divider(),
            const AIQuestionWidget(),
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

            // 🔹 TODAY PRODUCTS LIST
            const Text(
              'Products for selected day',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TodayProductsList(date: selectedDate),

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
