import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/Providers/TipCalculatorModel.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TipCalculatorModel(),
      child: const MyApp(),
    ),
  );
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
    final model = Provider.of<TipCalculatorModel>(
      context,
    );
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
            TotalPerPerson(
              theme: theme,
              style: style,
              total: model.totalPerPerson,
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
                    billAmount:
                        model.billTotal
                            .toString(),
                    onChanged: (value) {
                      model.updateBillTotal(
                        double.parse(value),
                      );
                      // print('Amonut: $value');
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
                        personCount:
                            model.personCount,
                        onDecreament: () {
                          if (model.personCount >
                              1) {
                            model.updatePersonCount(
                              model.personCount-1,
                            );
                          }
                        },
                        onIncreament: () {
                          model.updatePersonCount(
                            model.personCount + 1,
                          );
                        },
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
                        model.tipPercentage
                            .toString(),
                        style:
                            theme
                                .textTheme
                                .titleMedium,
                      ),
                    ],
                  ),

                  //slider text
                  Text(
                    '${(model.tipPercentage * 100).round()}%',
                  ),

                  //Tip slider
                  TipSlider(
                    tipPercentage:
                        model.tipPercentage,
                    onChanged: (double value) {
                      model.updateTipPercentage(
                        value,
                      );
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
