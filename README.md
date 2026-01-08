# AgroBiz Simulator - Gula Semut (Palm Sugar) Factory Feasibility Calculator

## Student Information
**Nama:** Dindam Darusalam  
**Peran:** Lead Developer  
**Topik:** Pabrik Gula Semut (Palm Sugar)

---

## Deskripsi Kasus
Proyek ini adalah simulasi studi kelayakan bisnis untuk pendirian pabrik **Gula Semut (Palm Sugar)**. User dapat menginput variabel investasi (CAPEX) dan biaya operasional (OPEX) untuk melihat apakah usaha tersebut layak dijalankan berdasarkan indikator finansial (BEP & ROI).

---

## Rumus yang Digunakan

### 1. Total CAPEX & OPEX
- **Total Capex** = Harga Mesin + Renovasi + Perizinan
- **Total Opex** = Bahan Baku + Tenaga Kerja + Energi + Kemasan

### 2. Profit Calculation
- **Revenue (Omzet)** = Kapasitas Produksi × Harga Jual
- **Monthly Profit (Laba Bersih)** = Revenue - Total Opex

### 3. Return on Investment (ROI)
ROI dihitung secara tahunan:
$$ \text{ROI} = \left( \frac{\text{Monthly Profit} \times 12}{\text{Total Investasi (CAPEX)}} \right) \times 100\% $$

### 4. Break Even Point (BEP)
BEP (Titik Impas) dihitung dalam satuan unit:
$$ \text{BEP (Unit)} = \frac{\text{Fixed Cost}}{\text{Price} - \text{Variable Cost per Unit}} $$

*Asumsi:*
- **Fixed Cost:** Tenaga Kerja + Energi
- **Variable Cost:** Bahan Baku + Kemasan

---

## Fitur Aplikasi
- **Simulasi Instan:** Menghitung BEP dan ROI saat angka diketik.
- **Responsif:** Tampilan optimal di HP (Mobile Layout) dan Laptop (Web Layout).
- **Visualisasi:** Pie Chart untuk melihat proporsi biaya operasional.
- **Stateless:** Tidak ada login atau database, data reset saat di-refresh.

---

## Deployment Links
- **Web Demo:** [Link to Vercel App](https://agrobiz-simulator.vercel.app) *(To be updated)*
- **Android APK:** [Download Release](https://github.com/dindam/agrobiz_simulator/releases) *(Check GitHub Releases)*

---

## Screenshots

| Android View | Web View |
|:---:|:---:|
| *(Place screenshot here)* | *(Place screenshot here)* |

---
*Dikembangkan menggunakan Flutter Framework.*
