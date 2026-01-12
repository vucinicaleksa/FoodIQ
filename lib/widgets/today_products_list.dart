import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodayProductsList extends StatelessWidget {
  const TodayProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final today = DateTime.now().toIso8601String().split('T').first;

    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('daily_intake')
              .doc(today)
              .collection('items')
              .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        return Column(
          children:
              snapshot.data!.docs.map((doc) {
                return ListTile(
                  title: Text(doc['name']),
                  subtitle: Text(
                    '${doc['grams']} g • ${doc['calories'].toStringAsFixed(0)} kcal',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => doc.reference.delete(),
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
