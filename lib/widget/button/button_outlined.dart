import 'package:flutter/material.dart';

import 'button_style.dart';

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
    this.borderColor,
    this.textColor,
    this.elevation = 0,
    this.height = 40,
    this.minWidth = 0,
    this.style = Style.normal,
  }) : super(key: key);

  final Function()? onPressed;
  final String title;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double elevation;
  final double height;
  final double minWidth;
  final Style style;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Container(
      height: heightByStyle(style),
      constraints: BoxConstraints(minWidth: minWidth),
      child: OutlinedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: verticalPaddingByStyle(style) - 2,
              horizontal: horizontalPaddingByStyle(style) - 2,
            ),
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          side: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(color: themeData.disabledColor, width: 2);
              }
              return BorderSide(color: themeData.primaryColor, width: 2);
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return themeData.disabledColor;
              }
              return color;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return themeData.disabledColor;
              }
              return textColor;
            },
          ),
          textStyle: MaterialStateProperty.all(
            textTheme.button?.copyWith(fontSize: fontSizeByStyle(style)),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }

  double heightByStyle(Style style) {
    switch (style) {
      case Style.normal:
        return 40;
      case Style.tiny:
        return 22;
      case Style.small:
        return 32;
      default:
        return 40;
    }
  }
}
