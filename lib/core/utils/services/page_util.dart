import 'dart:ui';

class PageUtil {
  factory PageUtil() {
    return _instance!;
  }

  PageUtil._();

  static PageUtil? _instance;
  static const int defaultWidth = 414;
  static const int defaultHeight = 896;

  /// Size of the phone in UI Design , px
  late num uiWidthPx;
  late num uiHeightPx;

  /// allowFontScaling Specifies whether fonts should scale to respect
  /// Text Size accessibility settings. The default is false.
  late bool allowFontScaling;

  static double? _screenWidth;
  static double? _screenHeight;
  static double? _pixelRatio;
  static double? _statusBarHeight;
  static double? _bottomBarHeight;
  static double? _textScaleFactor;

  static void init(
      {num width = defaultWidth,
      num height = defaultHeight,
      bool allowFontScaling = false}) {
    _instance ??= PageUtil._();

    _instance!.uiWidthPx = width;
    _instance!.uiHeightPx = height;
    _instance!.allowFontScaling = allowFontScaling;
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
  }

  /// The number of font pixels for each logical pixel.
  static double? get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double? get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double get screenWidth => _screenWidth! / _pixelRatio!;

  ///The vertical extent of this size. dp
  static double get screenHeight => _screenHeight! / _pixelRatio!;

  /// The vertical extent of this size. px
  static double? get screenWidthPx => _screenWidth;

  /// The vertical extent of this size. px
  static double? get screenHeightPx => _screenHeight;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight! / _pixelRatio!;

  /// The offset from the top
  static double? get statusBarHeightPx => _statusBarHeight;

  /// The offset from the bottom.
  static double? get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleHeight =>
      (_screenHeight! - _statusBarHeight! - _bottomBarHeight!) / uiHeightPx;

  double get scaleText => scaleWidth;

  /// [Width function]
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num setWidth(num width) => width * scaleWidth;

  /// [Height function]
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of
  /// adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference
  /// in shape.
  num setHeight(num height) => height * scaleHeight;

  ///FontSize function
  ///@param [fontSize] UI in px.
  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  num setSp(num fontSize, {bool? allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor!))
          : (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor!));
}
