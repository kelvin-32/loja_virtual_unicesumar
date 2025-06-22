import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int) result;

  const QuantityWidget({
    super.key,
    required this.value,
    required this.result,
    this.suffixText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: value > 1 ? () => result(value - 1) : null,
        ),
        Text('$value$suffixText'),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () => result(value + 1),
        ),
      ],
    );
  }
}
