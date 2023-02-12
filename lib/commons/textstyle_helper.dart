// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/commons/theme_helper.dart';

class TextStyleHelper {
  static TextStyle f28w400 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.white,
  );

  static TextStyle f64w500 = const TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w500,
    color: ThemeHelper.white,
  );

  static TextStyle f40w700 = const TextStyle(
    color: ThemeHelper.white,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );
}
