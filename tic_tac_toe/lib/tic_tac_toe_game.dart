// One possible solution
enum TicTacToeMark {
  x,
  o,
  none,
}

enum TicTacToeState {
  xTurn,
  oTurn,
  xWon,
  oWon,
  tie,
}

class TicTacToeGame {
  final board = List<TicTacToeMark>.filled(9, TicTacToeMark.none);
  var state = TicTacToeState.xTurn;

  void pressedSquare(int index) {
    if (board[index] != TicTacToeMark.none) {
      print("Ignore the click. That spot is taken.");
      return;
    }
    if (state == TicTacToeState.xTurn) {
      board[index] = TicTacToeMark.x;
      state = TicTacToeState.oTurn;
      checkForWin();
    } else if (state == TicTacToeState.oTurn) {
      board[index] = TicTacToeMark.o;
      state = TicTacToeState.xTurn;
      checkForWin();
    } else {
      print("Ignore the click. This game is over.");
    }
  }

  void checkForWin() {
    if (!board.contains(TicTacToeMark.none)) {
      state = TicTacToeState.tie;
    }
    final linesOf3 = <String>[];
    final bs = boardString;
    linesOf3.add(bs[0] + bs[1] + bs[2]);
    linesOf3.add(bs[3] + bs[4] + bs[5]);
    linesOf3.add(bs[6] + bs[7] + bs[8]);
    linesOf3.add(bs[0] + bs[3] + bs[6]);
    linesOf3.add(bs[1] + bs[4] + bs[7]);
    linesOf3.add(bs[2] + bs[5] + bs[8]);
    linesOf3.add(bs[0] + bs[4] + bs[8]);
    linesOf3.add(bs[6] + bs[4] + bs[2]);
    for (final lineOf3 in linesOf3) {
      if (lineOf3 == "XXX") {
        state = TicTacToeState.xWon;
      } else if (lineOf3 == "OOO") {
        state = TicTacToeState.oWon;
      }
    }
  }

  String get stateString => state.toString().split(".").last;

  String get boardString {
    String boardStr = "";
    for (final mark in board) {
      boardStr += (mark == TicTacToeMark.x)
          ? "X"
          : ((mark == TicTacToeMark.o) ? "O" : "-");
    }
    return boardStr;
  }

  @override
  String toString() {
    return "$stateString $boardString";
  }
}
