import 'package:flutter/material.dart';

final _sizeCache = <num, Map<num, double>>{};

extension ScreenDimension on num {
  double ws(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;

    if (_sizeCache.containsKey(deviceWidth) &&
        _sizeCache[deviceWidth]!.containsKey(this)) {
      return _sizeCache[deviceWidth]![this] as double;
    }

    if (!_sizeCache.containsKey(deviceWidth)) {
      _sizeCache.addAll({deviceWidth: {}});
    }

    final value = deviceWidth * (this / 100);
    _sizeCache[deviceWidth]!.addAll({this: value});

    return value;
  }

  double pixelScale(BuildContext context) => (this / 4).ws(context);

  double removeSpacingOnKeyboardVisible(BuildContext context) {
    if (MediaQuery.maybeViewInsetsOf(context)!.bottom > 0) {
      return this * 0;
    }
    return this * 1;
  }

  double addSpacingOnKeyboardVisible(BuildContext context) =>
      this + MediaQuery.maybeViewInsetsOf(context)!.bottom;

  double hs(BuildContext context) =>
      MediaQuery.sizeOf(context).height * (this / 100);
}
