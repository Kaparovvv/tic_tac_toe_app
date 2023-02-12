import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/commons/textstyle_helper.dart';
import 'package:tic_tac_toe_app/commons/theme_helper.dart';
import 'package:tic_tac_toe_app/presentation/widgets/custom_button_widget.dart';

class DialogWidget extends StatelessWidget {
  final String result;
  final Function() onPressed;
  const DialogWidget({
    super.key,
    required this.result,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeHelper.secondaryColor,
      contentPadding: const EdgeInsets.all(15.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            result,
            style: TextStyleHelper.f40w700,
          ),
          const SizedBox(height: 10.0),
          CustomButtonWidget(
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
            txtButton: 'Назад',
          ),
        ],
      ),
    );
  }
}
