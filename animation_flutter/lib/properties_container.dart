import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(AnimationContainerApp());
}

class AnimationContainerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedContainerAppState();
  
}

class _AnimatedContainerAppState extends State<AnimationContainerApp> {
  double _width = 50;
  double _heghit = 50;
  Color _color = Colors.green;
  
  BorderRadiusGeometry _borderRadis = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _heghit,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadis
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              final random = Random();

              _width = random.nextInt(300).toDouble();
              _heghit = random.nextInt(300).toDouble();

              _color = Color.fromARGB(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1,
              );
              _borderRadis = BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
        ),
      ),
    );
  }
  
}