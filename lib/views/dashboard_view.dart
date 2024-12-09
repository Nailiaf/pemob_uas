import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemob_uas/controllers/dashboard_controller.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package
import '../widgets/sidebar.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Jakarta',
            fontWeight: FontWeight.bold,
            color: Colors.white, // Teks putih untuk kontras
          ),
        ),
        backgroundColor: Colors.green[400], // Warna hijau pastel
        centerTitle: true,
      ),
      drawer: Sidebar(),
      body: Container(
        color: Colors.green[50], // Warna latar belakang hijau pastel
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Grafik Penjualan dan Transaksi
              Obx(() {
                double totalSales = controller.totalSales.value.toDouble();
                double totalTransactions =
                    controller.totalTransactions.value.toDouble();
                double averageSale = totalTransactions > 0
                    ? totalSales / totalTransactions
                    : 0.0;

                if (totalSales.isNaN || totalTransactions.isNaN) {
                  return const Center(
                    child: Text(
                      'Data Tidak Valid untuk Grafik',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  );
                }

                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(show: true),
                      borderData: FlBorderData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, totalSales),
                            FlSpot(1, totalTransactions),
                          ],
                          isCurved: true,
                          color: Colors.green,
                          belowBarData: BarAreaData(show: false),
                          dotData: FlDotData(show: true),
                        ),
                        LineChartBarData(
                          spots: [
                            FlSpot(0, averageSale),
                            FlSpot(1, averageSale),
                          ],
                          isCurved: false,
                          color: Colors.red,
                          belowBarData: BarAreaData(show: false),
                          dotData: FlDotData(show: false),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: 20),

              // Kartu Ringkasan
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green[100], // Warna hijau lembut untuk kartu
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        var formatter = NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp',
                          decimalDigits: 0,
                        );
                        return Text(
                          'Total Penjualan: ${formatter.format(controller.totalSales.value)}',
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      Obx(() {
                        return Text(
                          'Total Transaksi: ${controller.totalTransactions.value}',
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      Obx(() {
                        double averageSale =
                            controller.totalTransactions.value > 0
                                ? controller.totalSales.value /
                                    controller.totalTransactions.value
                                : 0.0;
                        var formatter = NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp',
                          decimalDigits: 0,
                        );
                        return Text(
                          'Rata-Rata Penjualan: ${formatter.format(averageSale)}',
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 16,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
