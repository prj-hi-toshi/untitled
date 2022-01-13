import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _myhand = 0;
  int _pchand = 0;
  String result = '';
  String pareHand = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your Win Times:',
            ),
            Text(
              '$_counter',
              style: TextStyle(color: selectColor(_counter)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    pareHand = 'my Hand is ROCK , ';
                    janken(0);
                  },
                  child: Text('rock'),
                ),
                OutlinedButton(
                  onPressed: () {
                    pareHand = 'my Hand is SCISSORS , ';
                    janken(1);
                  },
                  child: Text('scissors'),
                ),
                OutlinedButton(
                  onPressed: () {
                    pareHand = 'my Hand is PAPER , ';
                    janken(2);
                  },
                  child: Text('paper'),
                ),
              ],
            ),
            Text(pareHand),
            Text(result),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        // tooltip: 'Increment',
        onPressed: _resetCounter,
        tooltip: 'Counter Reset',
        child: const Icon(Icons.autorenew),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  Color selectColor(int number) {
    if (number < 10) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  void janken(int hand) {
    _myhand = hand;
    _pchand = Random().nextInt(3);
    if (_pchand == 0) {
      pareHand += 'pc Hand is ROCK.';
    } else if (_pchand == 1) {
      pareHand += 'pc Hand is SCISSORS';
    } else {
      pareHand += 'pc Hand is PAPER';
    }
    winOrLose(_myhand, _pchand);
  }

  void winOrLose(int a, int b) {
    setState(() {
      switch (((a - b) + 3) % 3) {
        case 0:
          result = 'DRAW';
          break;
        case 1:
          result = 'You Lose!';
          break;
        case 2:
          result = 'You Win!!';
          _incrementCounter();
          break;
      }
    });
  }
}
