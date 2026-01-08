class SimulationData {
  // CAPEX
  double machineCost;
  double renovationCost;
  double permitCost;

  // OPEX
  double rawMaterialCost;
  double laborCost;
  double energyCost;
  double packagingCost;

  // Targets
  double productionCapacity; // Per Month
  double sellingPrice; // Per Unit

  SimulationData({
    this.machineCost = 50000000,
    this.renovationCost = 20000000,
    this.permitCost = 5000000,
    this.rawMaterialCost = 10000000,
    this.laborCost = 5000000,
    this.energyCost = 2000000,
    this.packagingCost = 3000000,
    this.productionCapacity = 1000,
    this.sellingPrice = 30000,
  });

  double get totalCapex => machineCost + renovationCost + permitCost;
  
  // Total Monthly Expenses entered by user
  double get totalOpex => rawMaterialCost + laborCost + energyCost + packagingCost;

  // Revenue
  double get monthlyRevenue => productionCapacity * sellingPrice;

  // Profit
  double get monthlyProfit => monthlyRevenue - totalOpex;

  // Annualized ROI
  double get roi {
    if (totalCapex == 0) return 0;
    return ((monthlyProfit * 12) / totalCapex) * 100;
  }

  // BEP (Unit)
  // Assumption: 
  // Fixed Cost = Labor + Energy
  // Variable Cost = Raw Material + Packaging
  double get bepUnit {
    double fixedCost = laborCost + energyCost;
    double totalVariableCost = rawMaterialCost + packagingCost;
    
    if (productionCapacity == 0) return 0;
    
    double variableCostPerUnit = totalVariableCost / productionCapacity;
    double marginPerUnit = sellingPrice - variableCostPerUnit;

    if (marginPerUnit <= 0) return 0; // Loss or Infinite BEP

    return fixedCost / marginPerUnit;
  }

  // BEP (Rupiah)
  double get bepRupiah => bepUnit * sellingPrice;

  void reset() {
    machineCost = 0;
    renovationCost = 0;
    permitCost = 0;
    rawMaterialCost = 0;
    laborCost = 0;
    energyCost = 0;
    packagingCost = 0;
    productionCapacity = 0;
    sellingPrice = 0;
  }
}
