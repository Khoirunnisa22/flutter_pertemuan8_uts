import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterController>().counter;

    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: const TextStyle(fontSize: 48)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconButton(context, Icons.remove, () {
                  context.read<CounterController>().decrement();
                }),
                const SizedBox(width: 16),
                iconButton(context, Icons.add, () {
                  context.read<CounterController>().increment();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      onPressed: onTap,
      child: Icon(icon),
    );
  }
}
