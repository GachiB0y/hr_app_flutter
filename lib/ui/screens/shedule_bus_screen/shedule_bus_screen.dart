// import 'package:flutter/material.dart';

// class CityListWidget extends StatelessWidget {
//   final ScheduleBus scheduleBus;

//   CityListWidget({required this.scheduleBus});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('City List'),
//       ),
//       body: ListView.builder(
//         itemCount: scheduleBus.cities.length,
//         itemBuilder: (context, index) {
//           final city = scheduleBus.cities[index];
//           return ListTile(
//             title: Text(city.nameCity),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DestinationListWidget(city: city),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class DestinationListWidget extends StatelessWidget {
//   final City city;

//   DestinationListWidget({required this.city});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Destination List'),
//       ),
//       body: ListView.builder(
//         itemCount: city.destinations.length,
//         itemBuilder: (context, index) {
//           final destination = city.destinations[index];
//           return ListTile(
//             title: Text(destination.namePath),
//             onTap: () {
//               // Handle destination selection
//             },
//           );
//         },
//       ),
//     );
//   }
// }
