import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/data_handler_service.dart';

class LineGraphScreen extends StatefulWidget {
  @override
  _LineGraphScreenState createState() => _LineGraphScreenState();
}

class _LineGraphScreenState extends State<LineGraphScreen> {
  final CsvService csvService = CsvService();
  List<Map<String, dynamic>> priceRates = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> data = await csvService.fetchPriceRates();
      setState(() {
        priceRates = data;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

  List<FlSpot> getLineSpots() {
    // Convert fetched data into FlSpot for the line chart
    // Consider using the fetched data to create FlSpots for x and y coordinates
    // Example: return List<FlSpot> containing x and y coordinates for the graph
    return []/* List of FlSpot */;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price Trends'),
      ),
      body: LineChart(
        LineChartData(
          // Implement LineChartData configuration based on the fetched data
          // Configure data, line styles, axes, etc. as needed for the line chart
          // Example: use getLineSpots() to set up line data
          titlesData: FlTitlesData(
            // Configure titles for x and y axes
            // Example: set titles for x and y axes
          ),
          borderData: FlBorderData(
            // Configure borders for the chart
            // Example: customize chart border
          ),
          lineBarsData: [
            LineChartBarData(
              spots: getLineSpots(),
              // Configure line style, colors, etc.
              // Example: set up line style and colors
            ),
          ],
        ),
      ),
    );
  }
}
