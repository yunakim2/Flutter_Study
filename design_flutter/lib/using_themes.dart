import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyThemeApp());


class MyThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = "Custom theme";
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // fontFamily:

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0)
        )
      ),
      home: MyThemeAppPage(
        title: appName
      ),
    );
  }
}

class MyThemeAppPage extends StatelessWidget {
  final String title;

  MyThemeAppPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(title),
     ),
     body: Center(
       child: Container(
         color: Theme.of(context).accentColor,
         child: Text(
           'Text With Background Color',
           style: Theme.of(context).textTheme.title,
         ),
       ),
     ),
     floatingActionButton: Theme(
       data: Theme.of(context).copyWith(
         colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.yellow),
       ),
       child: FloatingActionButton(
         onPressed: null,
         child: Icon(Icons.add),
       ),
     ),
   );
  }

}