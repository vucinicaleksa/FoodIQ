import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DailySummaryWidget extends StatelessWidget {
  final DateTime date;

  const DailySummaryWidget({
    super.key,
    required this.date,
  });

  String get dateId =>
      "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('daily_intake')
          .doc(dateId)
          .collection('items')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        double calories = 0;
        double proteins = 0;
        double fats = 0;
        double carbs = 0;

        for (var doc in snapshot.data!.docs) {
          calories += (doc['calories'] as num).toDouble();
          proteins += (doc['proteins'] as num).toDouble();
          fats += (doc['fats'] as num).toDouble();
          carbs += (doc['carbs'] as num).toDouble();
        }

        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Daily intake',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '${calories.toStringAsFixed(0)} kcal',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'P: ${proteins.toStringAsFixed(1)} g  •  '
                  'F: ${fats.toStringAsFixed(1)} g  •  '
                  'C: ${carbs.toStringAsFixed(1)} g',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
