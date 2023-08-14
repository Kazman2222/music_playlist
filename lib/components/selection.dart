// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

const List<String> genre = [
  'POP',
  'ROCK',
  'JAZZ',
  'COUNTRY',
  'R&B',
  'HIPHOP',
  'BLUES',
  'ELECTRONIC',
  'AFROBEATS',
  'REGGAE',
  'HIGHLIFE'
];

const List<String> podcasts = [
  'Interviews',
  'Crime',
  'Comedy',
  'News',
  'History',
  'Self-Improvement',
  'Pop Culture',
  'Health',
  'Travel',
  'Business',
  'Technology',
  'Parenting',
  'Literature',
  'Language',
  'Sports',
  'Music',
  'Environment',
  'Cooking',
  'Religion',
  'Art'
];

// Row andriodDropdown() {
//   List<DropdownMenuItem<String>> dropdownItems = [];
//   for (String song in genre) {
//     String songs = song;
//     var newItem = DropdownMenuItem(
//       value: songs,
//       child: Text(songs),
//     );
//     dropdownItems.add(newItem);
//   }
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const Text(
//         'Currency:',
//         style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
//       ),
//       const SizedBox(
//         width: 15,
//       ),
//       DropdownButton<String>(
//         value: Genre,
//         items: dropdownItems,
//         onChanged: (value) {
//           setState(() {
//             Genre = value.toString();
//           });
//           // kvalMoney = value;
//         },
//       ),
//     ],
//   );
// }
//
// // List<DropdownMenuItem<String>> getDropdownCurrency() {
// //
// // }
//
// CupertinoPicker iOSPicker() {
//   List<Widget> cupertinoDropdown = [];
//   for (String song in genre) {
//     Widget genreList = Text(song);
//     cupertinoDropdown.add(genreList);
//   }
//   return CupertinoPicker(
//       // IOS Selection
//       backgroundColor: Colors.lightBlue,
//       magnification: 1.0,
//       itemExtent: 32.0,
//       onSelectedItemChanged: (selectedIndex) {
//         setState(() {
//           Genre = genre[selectedIndex].toString();
//         });
//       },
//       children: cupertinoDropdown);
// }
//
// Widget getPicker() {
//   if (!kIsWeb && Platform.isIOS) {
//     return iOSPicker();
//   } else {
//     return andriodDropdown();
//   }
// }

// class Uploads(){
//
// }
