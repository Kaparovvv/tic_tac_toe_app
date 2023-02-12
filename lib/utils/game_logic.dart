import 'package:tic_tac_toe_app/utils/player.dart';

class GameLogic {
  static const boardlenth = 9;

  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardlenth, (index) => Player.empty);
  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score;
    scoreboard[gridSize + col] += score;
    if (row == col) scoreboard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1] += score;

    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }
    return false;
  }
}
