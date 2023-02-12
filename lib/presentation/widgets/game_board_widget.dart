import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/commons/textstyle_helper.dart';
import 'package:tic_tac_toe_app/commons/theme_helper.dart';

class GameBoardWiidget extends StatelessWidget {
  final String board;
  const GameBoardWiidget({
    Key? key,
    required this.board,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: const Color(0xFF001456),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
        child: Text(
          board,
          style: TextStyleHelper.f64w500.copyWith(
              color: board == 'X' ? ThemeHelper.blue : ThemeHelper.red),
        ),
      ),
    );
  }
}
