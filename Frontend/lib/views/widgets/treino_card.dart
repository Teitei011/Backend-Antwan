// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class RoundWidget extends StatelessWidget {
//   // final String title;
//   // final String subtitle;
//   // final String youtubeLink;

//   // RoundWidget({this.title, this.subtitle, this.youtubeLink});
//   // RoundWidget({"Titulo", "Subtitulo", "Youtube Link"});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.all(Radius.circular(20.0)),
//       ),
//       padding: EdgeInsets.all(20.0),
//       margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: 18.0,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           InkWell(
//             onTap: () {
//               // launchURL(youtubeLink);
//             },
//             child: Text(
//               "Watch on YouTube",
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// //   void launchURL(String url) async {
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }
// }
