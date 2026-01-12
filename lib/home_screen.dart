import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/scan_screen.dart';

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
      MaterialPageRoute(
        builder: (_) => ScanScreen(barcode: code),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodIQ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Unesi barcode ručno',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _barcodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'npr. 737628064502',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: _searchManually,
              child: const Text('Pretraži proizvod'),
            ),

            const SizedBox(height: 30),

            const Divider(),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Skeniraj barcode'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ScanScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
