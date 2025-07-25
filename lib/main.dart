import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('UTip')),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:
                  theme
                      .colorScheme
                      .inversePrimary,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Total per Person',
                  style:
                      theme.textTheme.titleMedium,
                ),
                Text(
                  '\$200.23',
                  style:
                      theme
                          .textTheme
                          .displaySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
