import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/simulation_data.dart';

class InputSection extends StatelessWidget {
  final SimulationData data;
  final VoidCallback onDataChanged;

  const InputSection({
    super.key,
    required this.data,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Using Theme default shadows
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24.0), // More breathing room
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainHeader(context, 'Parameter Input'),
            const SizedBox(height: 24),
            
            _buildSectionHeader(context, 'CAPEX (Modal Awal)', Icons.domain),
            _buildCurrencyInput(
              label: 'Harga Mesin',
              value: data.machineCost,
              icon: Icons.precision_manufacturing,
              onChanged: (val) {
                data.machineCost = val;
                onDataChanged();
              },
            ),
            _buildCurrencyInput(
              label: 'Renovasi Bangunan',
              value: data.renovationCost,
              icon: Icons.home_work,
              onChanged: (val) {
                data.renovationCost = val;
                onDataChanged();
              },
            ),
            _buildCurrencyInput(
              label: 'Perizinan',
              value: data.permitCost,
              icon: Icons.verified_user,
              onChanged: (val) {
                data.permitCost = val;
                onDataChanged();
              },
            ),
            const SizedBox(height: 24),
            
            _buildSectionHeader(context, 'OPEX (Biaya Operasional)', Icons.monetization_on),
            _buildCurrencyInput(
              label: 'Bahan Baku',
              value: data.rawMaterialCost,
              icon: Icons.agriculture,
              onChanged: (val) {
                data.rawMaterialCost = val;
                onDataChanged();
              },
            ),
            _buildCurrencyInput(
              label: 'Tenaga Kerja',
              value: data.laborCost,
              icon: Icons.group,
              onChanged: (val) {
                data.laborCost = val;
                onDataChanged();
              },
            ),
             _buildCurrencyInput(
              label: 'Energi / Listrik',
              value: data.energyCost,
              icon: Icons.bolt,
              onChanged: (val) {
                data.energyCost = val;
                onDataChanged();
              },
            ),
             _buildCurrencyInput(
              label: 'Kemasan',
              value: data.packagingCost,
              icon: Icons.local_shipping,
              onChanged: (val) {
                data.packagingCost = val;
                onDataChanged();
              },
            ),
            const SizedBox(height: 24),
            
            _buildSectionHeader(context, 'Target Produksi', Icons.trending_up),
            _buildSliderInput(
              context,
              label: 'Kapasitas Produksi (Kg/Bulan)',
              value: data.productionCapacity,
              min: 0,
              max: 5000,
              onChanged: (val) {
                data.productionCapacity = val;
                onDataChanged();
              },
            ),
             _buildSliderInput(
              context,
              label: 'Harga Jual (Rp/Kg)',
              value: data.sellingPrice,
              min: 0,
              max: 100000,
              onChanged: (val) {
                data.sellingPrice = val;
                onDataChanged();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderInput(
    BuildContext context, {
    required String label,
    required double value,
    required double min,
    required double max,
    required Function(double) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                value.toStringAsFixed(0),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ],
        ),
        Slider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          divisions: 100,
          label: value.toStringAsFixed(0),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCurrencyInput({
    required String label,
    required double value,
    required Function(double) onChanged,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: value == 0 ? '' : value.toStringAsFixed(0),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          prefixText: 'Rp ',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          final doubleVal = double.tryParse(value) ?? 0;
          onChanged(doubleVal);
        },
      ),
    );
  }
}
