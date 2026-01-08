import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../models/simulation_data.dart';
import 'smart_insights.dart';
import '../../../../core/theme/app_theme.dart';

class ResultDashboard extends StatelessWidget {
  final SimulationData data;

  const ResultDashboard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Column(
      children: [
        SmartInsights(data: data),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.premiumGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hasil Simulasi',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
                const SizedBox(height: 24),
                _buildHighlightMetric(
                  context, 
                  'Estimasi Laba Bersih/Bulan', 
                  currencyFormat.format(data.monthlyProfit), 
                  isLightCheck: true
                ),
                const Divider(color: Colors.white24, height: 32),
                Row(
                  children: [
                    Expanded(child: _buildMetricCard(context, 'BEP Unit', '${data.bepUnit.toStringAsFixed(0)} Unit')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildMetricCard(context, 'ROI (Tahun)', '${data.roi.toStringAsFixed(1)} %')),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        Card(
           elevation: 0,
           margin: const EdgeInsets.symmetric(horizontal: 16),
           color: Theme.of(context).colorScheme.surface,
           child: Padding(
             padding: const EdgeInsets.all(16),
             child: Column(
               children: [
                  _buildResultRow(context, 'Total Investasi (CAPEX)', currencyFormat.format(data.totalCapex)),
                  _buildResultRow(context, 'Total Biaya Ops (OPEX)', currencyFormat.format(data.totalOpex)),
                  const SizedBox(height: 24),
                  Text('Proporsi Biaya Operasional', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 250, // Slightly taller
                    child: _buildPieChart(),
                  ),
               ],
             ),
           )
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildPieChart() {
    if (data.totalOpex == 0) {
      return Center(child: Text('Belum ada data biaya'));
    }

    return PieChart(
      PieChartData(
        sectionsSpace: 4,
        centerSpaceRadius: 40,
        sections: [
          _buildPieSection(data.rawMaterialCost, Colors.blueAccent, 'Bahan\nBaku'),
          _buildPieSection(data.laborCost, Colors.greenAccent, 'Tenaga\nKerja'),
          _buildPieSection(data.energyCost, Colors.orangeAccent, 'Energi'),
          _buildPieSection(data.packagingCost, Colors.redAccent, 'Kemasan'),
        ],
      ),
    );
  }

  PieChartSectionData _buildPieSection(double value, Color color, String title) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: title,
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [Shadow(color: Colors.black45, blurRadius: 2)],
      ),
      showTitle: value > 0,
    );
  }

  Widget _buildResultRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightMetric(BuildContext context, String label, String value, {bool isLightCheck = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white.withOpacity(0.3))),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32
              ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
