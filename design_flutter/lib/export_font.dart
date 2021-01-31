import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PackageFonts',
      home: MyHomePage(),
    );
  }

}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Package Fonts'),),
//       body: Center(
//         child: Text(
//           style:TextStyle(
//             fontFamily: 'Amatic'
//                 package: design_flutter
//           )
//         ),
//       ),
//     )
//   }
//
// }