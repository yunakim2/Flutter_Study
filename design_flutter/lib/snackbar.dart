import 'package:flutter/material.dart';

main() => runApp(MySnackBar());

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('snackBar Demo'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('A SnackBar!!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {

              },
            ),
          );

          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }

}