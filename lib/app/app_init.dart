import 'package:core/core.dart';
import 'package:exchange/app/app.dart';
import 'package:exchange/features/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// App initialization
class AppInit extends StatelessWidget {
  /// Constructor
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<Object?>>[
        BlocProvider<MainCubit>(
          create: (_) => getIt<MainCubit>(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
