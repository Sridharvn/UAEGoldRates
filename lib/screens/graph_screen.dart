import 'dart:ffi';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 30,),
          // const Text("Gold Rates",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          Center(child: GraphWidget(jsonData: dataList))
        ],
      ), // Use the property in your widget
    );
  }
}
class GraphWidget extends StatelessWidget {
  final List<csvData> jsonData;

  const GraphWidget({Key? key, required this.jsonData}) : super(key: key);

  double findMinimum(){
    double c=jsonData[0].morning;
    for(int i=0;i<jsonData.length;i++)
    {
      if(jsonData[i].morning<c) {
        c = jsonData[i].morning;
      }}
    return c;
      }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 300, // Set height as needed
      child: LineChart(

        LineChartData(
          // minY: 0,
          minY:findMinimum()-5,
          minX: -1,
          // maxX: jsonData.length.toDouble(),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
            leftTitles:  const AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 50,
                showTitles: true,
                // getTitlesWidget: (value,meta){
                //   if(value.toInt()%2==0){
                //     return Text(jsonData[value.toInt()].morning.toString());
                //   }
                //   else{
                //     return Text("");
                //   }
                // }
              )
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTitlesWidget: (value,meta) {
                // You can modify this logic based on your data
                if(value.toInt()%2==0 && value.toInt()!=0&&value.toInt()!=jsonData.length-1){
                return Text(jsonData[value.toInt()].date,);
                }
                else{
                  return const Text("");
                }
              },),

            ),
          ),
          borderData: FlBorderData(show: true, border: Border.all(color: Colors.blueAccent, width: 1)),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(jsonData.length, (index) {
                final double x = index.toDouble();
                final double y = jsonData[index].morning; // Access morning value from csvData
                return FlSpot(x, y);
              }),
              isCurved: false,
              color: Colors.green, // This argument might not be necessary in the updated version
              barWidth: 3,
              isStrokeCapRound: false,
              belowBarData: BarAreaData(show: false,color: Colors.amber.shade50),
            ),
          ],
        ),
      ),
    );
  }
}