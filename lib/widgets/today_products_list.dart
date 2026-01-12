import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodiq/services/notification_service.dart';

class TodayProductsList extends StatelessWidget {
  final DateTime date;

  const TodayProductsList({
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
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text(
            'No products for this day',
            style: TextStyle(color: Colors.grey),
          );
        }

        double totalCalories = 0;
        for (var doc in snapshot.data!.docs) {
          totalCalories += (doc['calories'] as num).toDouble();
        }

        // 🔹 Fetch daily goal
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((docUser) {
          final goal = (docUser.data()?['dailyGoal'] ?? 2000).toDouble();
          if (totalCalories >= goal) {
            // 🔔 Koristi tvoj NotificationService
            NotificationService.showGoalExceeded();
          }
        });

        return Column(
          children: snapshot.data!.docs.map((doc) {
            return Card(
              child: ListTile(
                title: Text(doc['name']),
                subtitle: Text(
                  '${doc['grams']} g • ${doc['calories'].toStringAsFixed(0)} kcal',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _showEditDialog(context, doc);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => doc.reference.delete(),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, QueryDocumentSnapshot doc) {
    final gramsController =
        TextEditingController(text: doc['grams'].toString());
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit product'),
        content: TextField(
          controller: gramsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Grams'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newGrams = double.tryParse(gramsController.text);
              if (newGrams != null && newGrams > 0) {
                final caloriesPerGram =
                    (doc['calories'] as num) / (doc['grams'] as num);
                doc.reference.update({
                  'grams': newGrams,
                  'calories': newGrams * caloriesPerGram,
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
