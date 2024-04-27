import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_expample_app/FutureProvider/meal_view.dart';
import 'package:riverpod_expample_app/StreamProvider/view.dart';
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   BitCoinPriceView(),
    );
  }
}

final stateCounterProvider = StateProvider<int>((ref) {
  int count =1;
  return count;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final counterProvider = ref.watch(stateCounterProvider);
    return Scaffold(
      body:  Center(
        child: Text(counterProvider.toString()),
      ),
      floatingActionButton: Row(
        children: [
          IconButton(onPressed: (){
            ref.read(stateCounterProvider.notifier).state =0;
          }, icon:const Icon(Icons.clear)),
          IconButton(onPressed: (){
            ref.read(stateCounterProvider.notifier).state ++;
          }, icon:const Icon(Icons.add)),
        ],
      ),
    );
  }
}
