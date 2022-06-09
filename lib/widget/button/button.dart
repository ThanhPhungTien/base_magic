import 'package:flutter/material.dart';

import 'button_style.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
    this.textColor,
    this.elevation = 0,
    this.minWidth = 0,
    this.style = Style.normal,
  }) : super(key: key);

  final Function()? onPressed;
  final String title;
  final Color? color;
  final Color? textColor;
  final double elevation;
  final double minWidth;
  final Style style;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Container(
      height: heightByStyle(style),
      constraints: BoxConstraints(minWidth: minWidth),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: verticalPaddingByStyle(style),
              horizontal: horizontalPaddingByStyle(style),
            ),
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
}
