import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const screenName = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: Center(child: Text('Value: $clickCounter', style: Theme.of(context).textTheme.titleLarge),),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            child: const Icon(Icons.remove),
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "increment",
            child: const Icon(Icons.add),
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
          ),
        ],
      ),
    );
  }
}
