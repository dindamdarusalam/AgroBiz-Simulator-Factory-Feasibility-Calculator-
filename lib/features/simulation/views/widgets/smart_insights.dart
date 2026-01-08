import 'package:flutter/material.dart';
import '../../models/simulation_data.dart';

class SmartInsights extends StatelessWidget {
  final SimulationData data;

  const SmartInsights({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final insights = _generateInsights(data);

    if (insights.isEmpty) {
      return const SizedBox.shrink(); // Don't show if no data/neutral
    }

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 8),
                Text(
                  'Smart Insights',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...insights.map((text) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Icon(Icons.check_circle, size: 14, color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          text,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  List<String> _generateInsights(SimulationData data) {
    final List<String> list = [];
    
    if (data.productionCapacity == 0 || data.sellingPrice == 0) return list;

    // ROI Check
    if (data.roi > 50) {
      list.add("ROI Anda sangat sehat (>50%/tahun). Usaha ini sangat bernilai untuk investasi jangka panjang.");
    } else if (data.roi < 10 && data.roi > 0) {
      list.add("ROI cukup rendah (<10%). Pertimbangkan untuk menaikkan harga jual atau menekan biaya bahan baku.");
    } else if (data.roi < 0) {
      list.add("Usaha diprediksi merugi. Cek kembali biaya operasional vs harga jual.");
    }

    // Profit Margin Check
    if (data.monthlyRevenue > 0) {
      final margin = (data.monthlyProfit / data.monthlyRevenue) * 100;
      if (margin > 30) {
        list.add("Margin profit tinggi (${margin.toStringAsFixed(1)}%). Strategi harga Anda sudah sangat bagus.");
      } else if (margin < 10 && margin > 0) {
        list.add("Margin tipis (${margin.toStringAsFixed(1)}%). Hati-hati terhadap fluktuasi harga bahan baku.");
      }
    }

    // BEP Check
    if (data.bepUnit > data.productionCapacity) {
      list.add("Waspada: BEP Unit (${data.bepUnit.toStringAsFixed(0)}) lebih tinggi dari kapasitas produksi (${data.productionCapacity.toStringAsFixed(0)}). Anda tidak akan mencapai balik modal.");
    }

    return list;
  }
}
