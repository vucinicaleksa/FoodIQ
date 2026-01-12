import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class AIQuestionWidget extends StatefulWidget {
  const AIQuestionWidget({super.key});

  @override
  State<AIQuestionWidget> createState() => _AIQuestionWidgetState();
}

class _AIQuestionWidgetState extends State<AIQuestionWidget> {
  final TextEditingController _controller = TextEditingController();
  String? _answer;
  bool _loading = false;

  void _askAI() async {
    final question = _controller.text.trim();
    if (question.isEmpty) return;

    setState(() {
      _loading = true;
      _answer = null;
    });

    final answer = await AIService.ask(question);

    setState(() {
      _answer = answer;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Ask AI about a product or calories:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:
                    'e.g. How many calories are in 100g of this product?',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _askAI,
              child: const Text('Ask AI'),
            ),
            const SizedBox(height: 10),
            if (_loading) const Center(child: CircularProgressIndicator()),
            if (_answer != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _answer!,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
