import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod101/pages/counter/counter.dart';

class CounterTracker extends StatefulWidget {
  const CounterTracker({super.key});

  @override
  State<CounterTracker> createState() => _CounterTrackerState();
}

class _CounterTrackerState extends State<CounterTracker> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(counterProvider);
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.blue),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Welcome to the counter tracker", style: TextStyle(fontSize: 32)),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            child: Text("add"),
          ),
        );
      },
    );
  }
}
