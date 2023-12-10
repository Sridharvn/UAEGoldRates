import 'package:flutter/material.dart';
import '../services/data_handler_service.dart';

class LineGraphScreen extends StatefulWidget {
  @override
  _LineGraphScreenState createState() => _LineGraphScreenState();
}

class _LineGraphScreenState extends State<LineGraphScreen> {
  final CsvService csvService = CsvService(); // Instantiate the CsvService

  List<Map<String, dynamic>> priceRates = []; // Initialize an empty list to hold price rates

  @override
  void initState() {
    super.initState();
    fetchData(); // Call method to fetch data when screen initializes
  }

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> data = await csvService.fetchPriceRates();
      setState(() {
        priceRates = data; // Update the priceRates list with fetched data
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error (e.g., show error message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price Trends'),
      ),
      body: Text("Hello")/* Implement code to display line graph using fetched data */,
    );
  }
}
