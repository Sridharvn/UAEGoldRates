import 'package:flutter/material.dart';
import '../services/data_handler_service.dart';

class PriceTableScreen extends StatefulWidget {
  @override
  _PriceTableScreenState createState() => _PriceTableScreenState();
}

class _PriceTableScreenState extends State<PriceTableScreen> {
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
        title: Text('Monthly Price Rates'),
      ),
      body: ListView.builder(
        itemCount: priceRates.length,
        itemBuilder: (context, index) {
          // Implement table row widget for each month's price rate based on fetched data
          return ListTile(
            title: Text(priceRates[index]['month']),
            subtitle: Text(priceRates[index]['price']),
            // Add any additional widgets as needed (e.g., icons, buttons)
          );
        },
      ),
    );
  }
}
