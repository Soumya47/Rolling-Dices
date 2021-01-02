import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  AnimationController _controller;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
    animation.addListener(() {
      setState(() {});
      print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNum = Random().nextInt(6) + 1;
          rightDiceNum = Random().nextInt(6) + 1;
        });
        print('Completed');
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dicee'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image(
                        height: 200 - (animation.value) * 200,
                        image: AssetImage(
                            'assets/images/dice-png-$leftDiceNum.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image(
                      height: 200 - (animation.value) * 200,
                      image: AssetImage(
                          'assets/images/dice-png-$rightDiceNum.png'),
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              onPressed: roll,
              child: Text(
                'Roll',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
