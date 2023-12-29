import 'package:flutter/material.dart';
import '../wigets/ad_widget.dart';

// ...
class PriceTableScreen extends StatelessWidget {
  const PriceTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// class PriceTableScreen extends StatefulWidget {
//   // ...
//
//   @override
//   Widget build(BuildContext context) {
//     var priceRates;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Monthly Price Rates'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: priceRates.length,
//               itemBuilder: (context, index) {
//                 // Implement table row widget for each month's price rate based on fetched data
//                 return ListTile(
//                   title: Text(priceRates[index]['month']),
//                   subtitle: Text(priceRates[index]['price']),
//                   // Add any additional widgets as needed (e.g., icons, buttons)
//                 );
//               },
//             ),
//           ),
//           AdWidget(), // Display ad widget at the bottom of the screen
//         ],
//       ),
//     );
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
