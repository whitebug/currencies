import 'package:exchange/features/main/blocs/blocs.dart';
import 'package:exchange/features/main/widgets/currency_item.dart';
import 'package:exchange/features/main/widgets/loading_currensices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController exchangeSendController = TextEditingController();
  final TextEditingController exchangeGetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().getCurrenciesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency converter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.currencies.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CurrencyItem(
                    title: 'You send',
                    controller: exchangeSendController,
                    onEditingComplete: () {},
                    currencies: state.currencies,
                  ),
                )
              else
                const LoadingCurrencies(),
              const SizedBox(
                height: 50,
                child: Center(
                  child: Icon(Icons.cached),
                ),
              ),
              if (state.currencies.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CurrencyItem(
                    title: 'They get',
                    controller: exchangeGetController,
                    onEditingComplete: () {},
                    currencies: state.currencies,
                  ),
                )
              else
                const LoadingCurrencies(),
            ],
          );
        },
      ),
    );
  }
}
