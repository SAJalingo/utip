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
          seedColor: Colors.deepPurple,
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
    //Add style
    final style = theme.textTheme.titleMedium!
        .copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        );
    return Scaffold( 
      appBar: AppBar(title: const Text('UTip')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                borderRadius:
                    BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Total per Person',
                    style: style,
                  ),
                  Text(
                    '\$200.23',
                    style: style.copyWith(
                      color:
                          theme
                              .colorScheme
                              .onPrimary,
                      fontSize:
                          theme
                              .textTheme
                              .displaySmall
                              ?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            //form
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(5),
                border: Border.all(
                  color:
                      theme.colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
