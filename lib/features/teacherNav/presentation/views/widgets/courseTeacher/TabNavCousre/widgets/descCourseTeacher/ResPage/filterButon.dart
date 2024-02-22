// import 'package:flutter/material.dart';
//h
// class FilterButton extends StatefulWidget {
//   const FilterButton({super.key});

//   @override
//   State<FilterButton> createState() => _FilterButtonState();
// }

// class _FilterButtonState extends State<FilterButton> {
//    List<DropdownMenuItem<String>> items = [
//   DropdownMenuItem(
//     value: 'All',
//     child: Text('All'),
//   ),
//   DropdownMenuItem(
//     value: 'Attending',
//     child: Text('Attending'),
//   ),
//   DropdownMenuItem(
//     value: 'Absent',
//     child: Text('Absent'),
//   ),
// ];
//   String selectedOption='All';
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//   alignment: Alignment.topLeft,
//   child: Padding(
//     padding: EdgeInsets.only(left: 8.0), // Adjust the left padding as needed
//     child: Container(
//       width: MediaQuery.of(context).size.width * 0.4, // Adjust the width as needed
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey,
//           width: 1.0,
//         ),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: DropdownButtonFormField<String>(
//         value: selectedOption,
//         onChanged: (newValue) {
//           setState(() {
//             selectedOption =  selectedOption;
//           });
//         },
//         alignment:Alignment.center,
//         items: items,
//         selectedItemBuilder: (BuildContext context) {
//           return items.map<Widget>((DropdownMenuItem<String> item) {
//             return Center(
//               child: Text(
//                 item.value!,
//                 style: TextStyle(
//                   color: Colors.black, // Customize the color of the selected item
//                 ),
//               ),
//             );
//           }).toList();
//         },
//         isDense: true, // Reduce the height of the dropdown button
//         decoration: InputDecoration(
//           border: InputBorder.none, // Remove the border from the input decoration
//           contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust the content padding as needed
//         ),
//       ),
//     ),
//   ),
// );
//   }
// }