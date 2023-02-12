import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/commons/textstyle_helper.dart';
import 'package:tic_tac_toe_app/commons/theme_helper.dart';

class CustomButtonWidget extends StatelessWidget {
  final String txtButton;
  final Function() onPressed;

  const CustomButtonWidget({
    super.key,
    required this.txtButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ThemeHelper.color7E5BC2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        txtButton,
        style: TextStyleHelper.f28w400.copyWith(color: ThemeHelper.white),
      ),
    );
  }
}
