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
          setState(() {
            game.pressedSquare(k);
          });
          print("new state == $game");
        },
        child: Text(
          (game.board[k] == TicTacToeMark.x)
              ? "X"
              : ((game.board[k] == TicTacToeMark.o) ? "O" : " "),
          style: TextStyle(fontSize: 90.0),
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.gameStateString,
                style: Theme.of(context).textTheme.headline4,
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500.0),
                  child: GridView.count(
                    childAspectRatio: 1 / 1,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: buttons,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        game = TicTacToeGame();
                      });
                    },
                    child: const Text("New Game",
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  SizedBox(width: 20.0),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
