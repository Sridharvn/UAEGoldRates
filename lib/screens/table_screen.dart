import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:uae_gold_rates/models/csvData.dart';
import 'package:uae_gold_rates/screens/graph_screen.dart';
import 'package:uae_gold_rates/utils/constants.dart';
import 'package:uae_gold_rates/services/data_handler_service.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: SafeArea(
        child: FutureBuilder<List<csvData>>(
          future: CsvService().fetchPriceRates(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // return Center(child: Text('Error: ${snapshot.error}'));
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    const Text(appTitle,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    GraphScreen(
                      dataList: snapshot.data!,
                    ),
                    const SizedBox(height: 60,),
                    const Text(appTitle,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    Center(child: buildDataTableFromJson(snapshot.data!)),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildDataTableFromJson(List<csvData> jsonData) {
    return DataTable(
      // decoration: BoxDecoration(color: accentColor,),
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            columns[0],
            style: const TextStyle(fontStyle: FontStyle.normal),
          ),
        ),
        DataColumn(
          label: Text(
            columns[1],
            style: const TextStyle(fontStyle: FontStyle.normal),
          ),
        ),
        DataColumn(
          label: Text(
            columns[2],
            style: const TextStyle(fontStyle: FontStyle.normal),
          ),
        ),
      ],
      rows: jsonData.map((data) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(data.date)), // Assuming 'name' is a field in csvData
            DataCell(Text(data.morning
                .toString())), // Assuming 'age' is a field in csvData
            DataCell(Text(data.evening
                .toString())), // Assuming 'role' is a field in csvData
          ],
        );
      }).toList(),
    );
  }
}
