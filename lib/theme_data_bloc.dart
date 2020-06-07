import 'dart:async';

import 'package:flutter/material.dart';
import 'package:light/light.dart';

class ThemeDataBloc implements Bloc {
  Light _light;
  StreamSubscription _subscription;

  final _themeDataStreamController = StreamController<ThemeMode>();

  StreamSink<ThemeMode> get _themeDataSink =>
      _themeDataStreamController.sink;

  Stream<ThemeMode> get themeDataStream =>
      _themeDataStreamController.stream;

  @override
  void dispose() {
    _themeDataStreamController.close();
    _subscription.cancel();
  }

  ThemeDataBloc() {
    _light = Light();
    _subscription = _light.lightSensorStream.listen((lux) {
      if (lux >= 40) {
        _themeDataSink.add(ThemeMode.light);
      } else {
        _themeDataSink.add(ThemeMode.dark);
      }
    });
  }
}

abstract class Bloc {
  void dispose();
}
