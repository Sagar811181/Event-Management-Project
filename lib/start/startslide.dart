// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class startsllider extends StatefulWidget {
//   const startsllider({super.key});

//   @override
//   State<startsllider> createState() => _startslliderState();
// }

// class _startslliderState extends State<startsllider> {
//   PageController _controller = PageController();
//   bool islastpage = false;

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(bottom: 80),
//         child: Stack(
//           children: [
//             PageView(
//               controller: _controller,
//               onPageChanged: (Index) {
//                 setState(() {
//                   islastpage = Index == 2;
//                 });
//               },
//               children: [
//                 Container(
//                           width: double.infinity,
//                           height: 760,
//                           color: Colors.black,
//                           child: Image.asset(
//                             'assets/images/ph 18 (2).jpg',
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                           ),
//                         ),
//                 Container(
//                           width: double.infinity,
//                           height: 760,
//                           color: Colors.black,
//                           child: Image.asset(
//                             'assets/images/ph 18 (2).jpg',
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                           ),
//                         ),
//                 Container(
//                           width: double.infinity,
//                           height: 760,
//                           color: Colors.black,
//                           child: Image.asset(
//                             'assets/images/ph 18 (2).jpg',
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                           ),
//                         ),
//               ],
//             ),
//             Container(
//               child: SmoothPageIndicator(controller: _controller, count: 3),
//               alignment: Alignment(0, 0.75),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }




//  // bottomSheet: islastpage
//       //     ? TextButton(
//       //         style: TextButton.styleFrom(
//       //           backgroundColor: Colors.black,
//       //           shape: RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.circular(12),
//       //           ),fixedSize: Size(150, 70)
//       //         ),
//       //         child: Text(
//       //           "Get start",
//       //           style: TextStyle(
//       //             fontSize: 20,
                  
//       //           ),
//       //         ),
//       //         onPressed: () async {},
//       //       )
//       //     : Container(
//       //         padding: EdgeInsets.symmetric(horizontal: 21),
//       //         height: 80,
//       //         child: Row(
//       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //           children: [
//       //             TextButton(
//       //               onPressed: () => controller.jumpToPage(2),
//       //               child: Text("Skip"),
//       //             ),
//       //             Center(
//       //               child: SmoothPageIndicator(
//       //                 controller: controller,
//       //                 count: 3,
//       //                 effect: WormEffect(
//       //                     spacing: 16,
//       //                     dotColor: Colors.black,
//       //                     activeDotColor: Colors.teal.shade700),
//       //                 onDotClicked: (index) => controller.animateToPage(
//       //                   index,
//       //                   duration: Duration(
//       //                     milliseconds: 500,
//       //                   ),
//       //                   curve: Curves.ease,
//       //                 ),
//       //               ),
//       //             ),
//       //             TextButton(
//       //               onPressed: () => controller.nextPage(
//       //                   duration: Duration(
//       //                     milliseconds: 500,
//       //                   ),
//       //                   curve: Curves.easeInOut),
//       //               child: Text("Next"),
//       //             ),
//                 // ],
//               // ),
//             // ),