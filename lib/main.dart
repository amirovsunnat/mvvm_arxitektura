import 'package:flutter/material.dart';
import 'package:mvvm_architecture_darsi/logic/flavour_notifier.dart';
import 'package:mvvm_architecture_darsi/model/flavour_repo.dart';
import 'package:mvvm_architecture_darsi/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) =>
          FlavourNotifier(flavourRepository: FlavourRepository()),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlavoursScreen(),
    );
  }
}
