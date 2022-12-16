import 'package:flutter/material.dart';

import 'tic_tac_toe_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var game = TicTacToeGame();

  String get gameStateString {
    switch (game.state) {
      case TicTacToeState.xTurn:
        return "X's turn";
      case TicTacToeState.oTurn:
        return "O's turn";
      case TicTacToeState.xWon:
        return "X won";
      case TicTacToeState.oWon:
        return "O won";
      case TicTacToeState.tie:
        return "Tie";
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttons = <ElevatedButton>[];
    for (var k = 0; k < 9; k++) {
      buttons.add(ElevatedButton(
        onPressed: () {
          print("You pressed button number $k");
        },
        child: Text(
          "X",
          style: TextStyle(fontSize: 90.0),
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.gameStateString,
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: buttons,
              ),
            )
          ],
        ),
      ),
    );
  }
}
