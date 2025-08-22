import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// declared a provider
final productNameProvider = Provider<String>((ref) => "Loaf");
final counterProvider = Provider<int>((ref) => 0);
final numbersProvider = Provider<List<int>>((ref) => [0, 1, 2, 3]);

// widget
class MyHomePage extends ConsumerStatefulWidget {
  // ref
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.read(counterProvider);
    final name = ref.read(productNameProvider);
    final numbers = ref.read(numbersProvider);
    final car = ref.read(carProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$counter", style: TextStyle(fontSize: 32)),
            Text(name, style: TextStyle(fontSize: 32)),
            Text(numbers.toString(), style: TextStyle(fontSize: 32)),
            Text("${car.brand} ${car.name}", style: TextStyle(fontSize: 32)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
