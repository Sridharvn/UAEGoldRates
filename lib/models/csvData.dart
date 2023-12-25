import 'package:csv/csv.dart';
class csvData {
  final String date;
  final double morning;
  final double evening;


  csvData({
    required this.date,
    required this.morning,
    required this.evening,
  });

  factory csvData.fromJson(Map<String, dynamic> json) {
    return csvData(
      date: json['Date'],
      morning: double.parse(json['Morning']),
      evening: double.parse(json['Evening']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'morning': morning,
      'evening': evening,
    };
  }
  static List<csvData> parseCsvToCsvData(String csvString) {
    List<List<dynamic>> csvList = const CsvToListConverter().convert(csvString);

    // Remove header if needed
    if (csvList.isNotEmpty && csvList[0][0] == 'Date') {
      csvList.removeAt(0);
    }

    return csvList.map((row) {
      return csvData(
        date: row[0],
        morning: double.parse(row[1].toString()),
        evening: double.parse(row[2].toString()),
      );
    }).toList();
  }
}
