import 'package:exchange/features/main/widgets/dropdown.dart';
import 'package:flutter/material.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    required this.title,
    required this.controller,
    required this.onEditingComplete,
    this.currencies,
    super.key,
  });

  final String title;
  final TextEditingController controller;
  final List<String>? currencies;
  final VoidCallback onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                onEditingComplete: onEditingComplete,
              ),
            ),
            const SizedBox(width: 50),
            Dropdown(currencies: currencies),
          ],
        ),
      ],
    );
  }
}
