import 'package:flutter/material.dart';
export 'package:flutter/material.dart';
export './constants.dart';
export './colors.dart';
export 'package:get/get.dart';
export '../widgets/widget.dart';

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  IconThemeData get iconThem => theme.iconTheme;
  TextTheme get text => theme.textTheme;
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get devicePaddingTop => MediaQuery.of(this).padding.top;
  double get devicePaddingBottom => MediaQuery.of(this).padding.bottom;
}
