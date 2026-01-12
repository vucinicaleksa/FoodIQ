import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoalWidget extends StatefulWidget {
  const GoalWidget({super.key});

  @override
  State<GoalWidget> createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  final TextEditingController _controller = TextEditingController();
  double goal = 2000; // default goal

  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    _loadGoal();
  }

  Future<void> _loadGoal() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists && doc.data()?['dailyGoal'] != null) {
      setState(() {
        goal = (doc.data()?['dailyGoal'] as num).toDouble();
        _controller.text = goal.toStringAsFixed(0);
      });
    } else {
      _controller.text = goal.toStringAsFixed(0);
    }
  }

  Future<void> _saveGoal() async {
    final value = double.tryParse(_controller.text);
    if (value == null || value <= 0) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({'dailyGoal': value}, SetOptions(merge: true));

    setState(() {
      goal = value;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Goal saved!')));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Daily Goal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixText: 'kcal',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveGoal,
              child: const Text('Save Goal'),
            ),
            const SizedBox(height: 10),
            Text(
              'Current goal: ${goal.toStringAsFixed(0)} kcal',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
