enum Style {
  normal,
  small,
  tiny,
}

double heightByStyle(Style style) {
  switch (style) {
    case Style.normal:
      return 48;
    case Style.small:
      return 40;
    case Style.tiny:
      return 32;
    default:
      return 48;
  }
}

double verticalPaddingByStyle(Style style) {
  switch (style) {
    case Style.normal:
      return 12;
    case Style.small:
      return 8;
    case Style.tiny:
      return 4;
    default:
      return 12;
  }
}

double horizontalPaddingByStyle(Style style) {
  switch (style) {
    case Style.normal:
      return 16;
    case Style.small:
      return 8;
    case Style.tiny:
      return 8;
    default:
      return 16;
  }
}

double fontSizeByStyle(Style style) {
  switch (style) {
    case Style.normal:
      return 16;
    case Style.small:
      return 16;
    case Style.tiny:
      return 16;
    default:
      return 16;
  }
}
