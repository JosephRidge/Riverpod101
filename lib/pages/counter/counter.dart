import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod101/pages/counterTracker/counter_tracker.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
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
                Text("Add More", style: TextStyle(fontSize: 32)),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: Text("Add"),
              ),
              SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => CounterTracker(),
                    ),
                  );
                },
                child: Text("next"),
              ),
            ],
          ),
        );
      },
    );
  }
}

/**
 * 
 * TODO: 
 * - fundamentals of states (stateful, stateless, ephemerals & app state)
 * - provider
 * - riverpod
 */
