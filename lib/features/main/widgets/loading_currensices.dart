import 'package:flutter/material.dart';

class LoadingCurrencies extends StatelessWidget {
  const LoadingCurrencies({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
