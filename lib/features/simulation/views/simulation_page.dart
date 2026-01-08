import 'package:flutter/material.dart';
import '../models/simulation_data.dart';
import 'widgets/input_section.dart';
import 'widgets/result_dashboard.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key});

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  final SimulationData _data = SimulationData();
  int _inputKeyCounter = 0;

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgroBiz: Gula Semut Simulator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Reset Simulasi",
            onPressed: () {
               setState(() {
                 _data.reset();
                 _inputKeyCounter++;
               });
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Web / Tablet Layout (Row)
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: InputSection(
                      key: ValueKey(_inputKeyCounter),
                      data: _data, 
                      onDataChanged: _refresh
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: ResultDashboard(data: _data),
                  ),
                ),
              ],
            );
          } else {
            // Mobile Layout (Column)
            return SingleChildScrollView(
              child: Column(
                children: [
                  InputSection(
                    key: ValueKey(_inputKeyCounter),
                    data: _data, 
                    onDataChanged: _refresh
                  ),
                  ResultDashboard(data: _data),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
