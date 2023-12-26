import 'package:http/http.dart' as http;
import 'package:uae_gold_rates/models/csvData.dart';
import './../utils/constants.dart' as constants;

class CsvService {
  Future<List<csvData>> fetchPriceRates() async {
    try {
      final response = await http.get(Uri.parse(constants.csvLocation));
      if (response.statusCode == 200) {
        // Parse CSV data and extract price rates
        // Implement CSV parsing logic here
        // Return a list of Map or a custom model containing the price rates
        print(response.body);

        List<csvData> dataList = csvData.parseCsvToCsvData(response.body);
        print(dataList.map((e) => e.evening));
        return dataList;/* List of extracted price rates */;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}