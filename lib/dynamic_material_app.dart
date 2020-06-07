library dynamic_material_app;

import 'package:dynamic_material_app/theme_data_bloc.dart';
import 'package:flutter/material.dart';

class DynamicMaterialApp extends StatefulWidget {

  final ThemeData theme;
  final ThemeData darkTheme;
  final Widget home;

  @override
  _DynamicMaterialAppState createState() => _DynamicMaterialAppState();

  DynamicMaterialApp({
    @required this.theme,
    @required this.darkTheme,
    @required this.home,
  });
}

class _DynamicMaterialAppState extends State<DynamicMaterialApp> {
  ThemeDataBloc _themeDataBloc;

  @override
  void initState() {
    super.initState();
    _themeDataBloc = ThemeDataBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      stream: _themeDataBloc.themeDataStream,
      builder: (context, snapshot) {
        return MaterialApp(
          themeMode: snapshot.hasData ? snapshot.data : ThemeMode.system,
          darkTheme: widget.darkTheme,
          theme: widget.darkTheme,
          home: widget.home,
        );
      },
    );
  }

  @override
  void dispose() {
    _themeDataBloc.dispose();
    super.dispose();
  }
}
