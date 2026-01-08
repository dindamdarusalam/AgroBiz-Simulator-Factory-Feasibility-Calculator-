import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/simulation/views/simulation_page.dart';

void main() {
  runApp(const AgroBizApp());
}

class AgroBizApp extends StatelessWidget {
  const AgroBizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroBiz Simulator - Gula Semut',
      theme: AppTheme.lightTheme,
      home: const SimulationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
