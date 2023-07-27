// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// // class AnimatedIndicator extends StatefulWidget {
// //   const AnimatedIndicator(
// //       {Key? key,
// //       required this.length,
// //       required this.index,
// //       this.alignment = MainAxisAlignment.start,
// //       this.color,
// //       this.onTap})
// //       : super(key: key);
// //
// //   final int length;
// //   final int index;
// //   final MainAxisAlignment alignment;
// //   final Color? color;
// //   final Function(int i)? onTap;
// //
// //   @override
// //   State<AnimatedIndicator> createState() => _AnimatedIndicatorState();
// // }
// //
// // class _AnimatedIndicatorState extends State<AnimatedIndicator> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: widget.alignment,
// //       children: List.generate(
// //           widget.length,
// //           (i) => GestureDetector(
// //               onTap: () => {
// //                     if (widget.onTap != null) {widget.onTap!(i)}
// //                   },
// //               child: AnimatedContainer(
// //                 duration: const Duration(milliseconds: 300),
// //                 margin: const EdgeInsets.only(left: 4),
// //                 height: 6,
// //                 curve: Curves.easeInOut,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(100),
// //                   color:
// //                       widget.color?.withOpacity(i == widget.index ? 1 : 0.19) ??
// //                           Color(state.color)
// //                               .withOpacity(i == widget.index ? 1 : 0.19),
// //                 ),
// //                 width: i == widget.index ? 70 : 15,
// //               ))),
// //     );
// //   }
// // }
//
// class AnimeIndicator extends StatefulWidget {
//   // const AnimeIndicator({Key? key}) : super(key: key);
//
//   AnimeIndicator({
//     required this.index
// });
//
//   late int index;
//
//
//   @override
//   State<AnimeIndicator> createState() => _AnimeIndicatorState();
// }
//
// class _AnimeIndicatorState extends State<AnimeIndicator> {
//   // late index = index;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 195.w,
//       height: 12.h,
//       decoration: BoxDecoration(
//         color: Colors.lightGreenAccent,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           width: 0.0, // Border width
//           style: BorderStyle.solid, // Set the border style to solid
//         ),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 65.w,
//             height: 12.h,
//             decoration: BoxDecoration(
//               color: index ?  ,
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           Container(
//             width: 65.w,
//             height: 12.h,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           Container(
//             width: 65.w,
//             height: 12.h,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
