import 'dart:io' as io;
import 'package:flutter/material.dart';

enum Breakpoint { xs, sm, md, lg, xl }
enum Platform { all, linux, macos, windows, android, ios, fuchsia }

class Condition {
  static const double breakpointXs = 0;
  static const double breakpointSm = 576;
  static const double breakpointMd = 768;
  static const double breakpointLg = 992;
  static const double breakpointXl = 1200;

  double _min = breakpointXs;
  double _max = breakpointXl;
  List<Platform> _platforms = [Platform.all];

  double _getPoint(Breakpoint point) {
    switch (point) {
      case Breakpoint.xs:
        return breakpointXs;
      case Breakpoint.sm:
        return breakpointSm;
      case Breakpoint.md:
        return breakpointMd;
      case Breakpoint.lg:
        return breakpointLg;
      case Breakpoint.xl:
        return breakpointXl;
    }
  }

  Condition(
      {required Breakpoint screenMin,
      required Breakpoint screenMax,
      List<Platform>? platforms}) {
    _min = _getPoint(screenMin);
    _max = _getPoint(screenMax);
    if (platforms != null) {
      _platforms = platforms;
    }
  }

  Condition.screenBetween({required Breakpoint min, required Breakpoint max}) {
    screenBetween(min: min, max: max);
  }

  Condition.screenUp(Breakpoint min) {
    screenUp(min);
  }

  Condition.screenDown(Breakpoint max) {
    screenDown(max);
  }

  Condition.platforms(List<Platform> platforms) : _platforms = platforms;

  void screenBetween({required Breakpoint min, required Breakpoint max}) {
    _min = _getPoint(min);
    _max = _getPoint(max);
  }

  void screenUp(Breakpoint min) {
    _min = _getPoint(min);
    _max = _getPoint(Breakpoint.xl);
  }

  void screenDown(Breakpoint max) {
    _min = _getPoint(Breakpoint.xs);
    _max = _getPoint(max);
  }

  void platforms(List<Platform> platforms) {
    _platforms = platforms;
  }

  bool check(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return _min < width && width <= _max && checkPlatforms(_platforms);
  }

  bool checkPlatforms(List<Platform> platforms) {
    return platforms.any((element) => checkPlatform(element));
  }

  bool checkPlatform(Platform platform) {
    switch (platform) {
      case Platform.all:
        return true;
      case Platform.linux:
        return io.Platform.isLinux;
      case Platform.macos:
        return io.Platform.isMacOS;
      case Platform.windows:
        return io.Platform.isWindows;
      case Platform.android:
        return io.Platform.isAndroid;
      case Platform.ios:
        return io.Platform.isIOS;
      case Platform.fuchsia:
        return io.Platform.isFuchsia;
    }
  }
}
