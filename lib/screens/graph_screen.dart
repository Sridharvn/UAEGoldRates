import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uae_gold_rates/models/csvData.dart';

class GraphScreen extends StatelessWidget {
  final List<csvData> dataList; // Define the property variable

  const GraphScreen({Key? key, required this.dataList}) : super(key: key); // Constructor to receive the property

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Text(dataList.toString()),
          GraphWidget(jsonData: dataList)
        ],
      ), // Use the property in your widget
    );
  }
}
class GraphWidget extends StatelessWidget {
  final List<csvData> jsonData;

  const GraphWidget({Key? key, required this.jsonData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 300, // Set height as needed
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            // bottomTitles: AxisTitles(
            //   showTitles: true,
            //   reservedSize: 22,
            //   getTitles: (value) {
            //     // You can modify this logic based on your data
            //     return jsonData[value.toInt()].date;
            //   },
            // ),
          ),
          borderData: FlBorderData(show: true, border: Border.all(color: Colors.blueAccent, width: 1)),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(jsonData.length, (index) {
                final double x = index.toDouble();
                final double y = jsonData[index].morning; // Access morning value from csvData
                return FlSpot(x, y);
              }),
              isCurved: true,
              color: Colors.blueAccent, // This argument might not be necessary in the updated version
              barWidth: 2,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}