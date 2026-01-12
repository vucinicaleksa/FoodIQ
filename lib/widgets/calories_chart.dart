import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CaloriesChart extends StatelessWidget {
  const CaloriesChart({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return FutureBuilder<List<FlSpot>>(
      future: _loadData(user.uid),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        return SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: snapshot.data!,
                  isCurved: true,
                  color: Colors.green,
                  barWidth: 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<List<FlSpot>> _loadData(String uid) async {
    final now = DateTime.now();
    List<FlSpot> spots = [];

    for (int i = 6; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      final dateKey = date.toIso8601String().split('T').first;

      final snap =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection('daily_intake')
              .doc(dateKey)
              .collection('items')
              .get();

      double calories = 0;
      for (var doc in snap.docs) {
        calories += (doc['calories'] as num).toDouble();
      }

      spots.add(FlSpot((6 - i).toDouble(), calories));
    }

    return spots;
  }
}
