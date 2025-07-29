import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';

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
  int personCount = 1;

  double tipPercentage = 0.0;

  //Methods
  void increament() {
    setState(() {
      personCount++;
    });
  }

  void decreament() {
    setState(() {
      if (personCount > 0) {
        personCount--;
      }
    });
  }

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
        padding: const EdgeInsets.all(8),
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
              margin: const EdgeInsets.fromLTRB(
                0,
                16,
                0,
                16,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(5),
                border: Border.all(
                  color:
                      theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: '100',
                    onChanged: (value) {
                      print('Amonut: $value');
                    },
                  ),
                  //split bill area
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        'Split',
                        style:
                            theme
                                .textTheme
                                .titleMedium,
                      ),
                      PersonCounter(
                        theme: theme,
                        personCount: personCount,
                        onDecreament: decreament,
                        onIncreament: increament,
                      ),
                    ],
                  ),

                  //Tip section
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        'Tip',
                        style:
                            theme
                                .textTheme
                                .titleMedium,
                      ),
                      Text(
                        '\$20',
                        style:
                            theme
                                .textTheme
                                .titleMedium,
                      ),
                    ],
                  ),

                  //slider text
                  Text(
                    '${(tipPercentage * 100).round()}%',
                  ),

                  //Tip slider
                  TipSlider(
                    tipPercentage: tipPercentage,
                    onChanged: (double value) {
                      setState(() {
                        tipPercentage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
