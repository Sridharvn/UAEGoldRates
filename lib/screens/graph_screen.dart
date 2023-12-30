import 'package:flutter/material.dart';
import 'package:uae_gold_rates/models/csvData.dart';

class GraphScreen extends StatelessWidget {
  final List<csvData> dataList; // Define the property variable

  const GraphScreen({Key? key, required this.dataList}) : super(key: key); // Constructor to receive the property

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(dataList.toString()), // Use the property in your widget
    );
  }
}
