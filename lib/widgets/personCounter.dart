import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required this.personCount,
    required this.onDecreament,
    required this.onIncreament,
  });

  final ThemeData theme;
  final int personCount;
  final VoidCallback onDecreament;
  final VoidCallback onIncreament;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: onDecreament,
          icon: const Icon(Icons.remove),
        ),
        Text(
          '$personCount',
          style: theme.textTheme.titleMedium,
        ),
        IconButton(
          color: theme.colorScheme.primary,
          onPressed: onIncreament,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}