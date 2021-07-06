import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinMaxValues {
  MinMaxValues({
    this.minX = 0,
    required this.maxX,
    this.minY = 0,
    required this.maxY,
  });

  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
}

class CustomChart extends StatelessWidget {
  CustomChart({
    required this.title,
    required this.size,
    required this.minMaxValues,
    required this.horizontalTiles,
    required this.verticalTiles,
    required this.data,
  });

  final List<Color> gradientColors = [
    const Color(0xFF009fe3),
    const Color(0xFF0999d8),
  ];

  final String title;
  final double size;
  final MinMaxValues minMaxValues;
  final Map<int, String> horizontalTiles;
  final Map<int, String> verticalTiles;
  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 20,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Text(
                title,
                style: Get.textTheme.headline1!.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 20),
              Container(
                height: size,
                width: Get.width - 70,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color:
                            verticalTiles[value] != null ? Color(0xFFD6D9DC) : Colors.transparent,
                        strokeWidth: 0.5,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 20,
                        getTextStyles: (_) => Get.textTheme.subtitle1!,
                        getTitles: (value) {
                          try {
                            return horizontalTiles[value]!;
                          } catch (_) {
                            return '';
                          }
                        },
                        margin: 12,
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (_) => Get.textTheme.subtitle1!,
                        getTitles: (value) {
                          try {
                            return verticalTiles[value]!;
                          } catch (_) {
                            return '';
                          }
                        },
                        reservedSize: 25,
                        margin: 12,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xFFD6D9DC),
                          width: 0.5,
                        ),
                        bottom: BorderSide(
                          color: const Color(0xFFD6D9DC),
                          width: 0.5,
                        ),
                      ),
                    ),
                    minX: minMaxValues.minX,
                    maxX: minMaxValues.maxX,
                    minY: minMaxValues.minY,
                    maxY: minMaxValues.maxY,
                    lineBarsData: [
                      LineChartBarData(
                        spots: _parseDataFromArray(),
                        isCurved: true,
                        colors: gradientColors,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true,
                            colors: gradientColors.map((color) => color.withOpacity(0.2)).toList()),
                      ),
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

  List<FlSpot> _parseDataFromArray() {
    final Map<int, double> dataAsMap = data.asMap();
    final List<FlSpot> spots = [];

    dataAsMap.forEach((index, value) => spots.add(FlSpot(index.toDouble(), value)));
    return spots;
  }
}
