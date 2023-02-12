import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/commons/textstyle_helper.dart';
import 'package:tic_tac_toe_app/commons/theme_helper.dart';
import 'package:tic_tac_toe_app/presentation/widgets/custom_button_widget.dart';
import 'package:tic_tac_toe_app/presentation/widgets/dialog_widget.dart';
import 'package:tic_tac_toe_app/presentation/widgets/game_board_widget.dart';
import 'package:tic_tac_toe_app/utils/game_logic.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String lastValue = "X";
  bool gameOver = false;
  bool isResetButton = false;
  int turn = 0;
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  late GameLogic game;

  @override
  void initState() {
    game = GameLogic();
    game.board = GameLogic.initGameBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeHelper.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "ОЧЕРЕДЬ:  $lastValue",
            style: TextStyleHelper.f40w700,
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: GameLogic.boardlenth ~/ 3,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(GameLogic.boardlenth, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] == "") {
                            setState(
                              () {
                                isResetButton = true;
                                game.board![index] = lastValue;
                                turn++;
                                gameOver = game.winnerCheck(
                                    lastValue, index, scoreboard, 3);

                                if (gameOver) {
                                  result = "ПОБЕДИЛ $lastValue";
                                } else if (!gameOver && turn == 9) {
                                  result = "НИЧЬЯ!";
                                  gameOver = true;
                                }
                                if (lastValue == "X") {
                                  lastValue = "O";
                                } else {
                                  lastValue = "X";
                                }

                                if (result.isNotEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => DialogWidget(
                                      result: result,
                                      onPressed: () {
                                        resetTheGame();
                                        isResetButton = false;
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          }
                        },
                  child: GameBoardWiidget(board: game.board![index]),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          isResetButton
              ? CustomButtonWidget(
                  onPressed: () {
                    resetTheGame();
                    isResetButton = false;
                  },
                  txtButton: 'Заново',
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  resetTheGame() {
    setState(() {
      game.board = GameLogic.initGameBoard();
      lastValue = "X";
      gameOver = false;
      turn = 0;
      result = "";
      scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
    });
  }
}
