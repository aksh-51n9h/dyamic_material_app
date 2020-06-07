# Dynamic Material App Widget

This widget automatically decides theme mode depending on the light in the surroundings.This only works for an Android app.

## Install
Add ```dynamic_material_app``` as a dependency in  `pubspec.yaml`.
For help on adding as a dependency, view the [documentation](https://flutter.io/using-packages/).

## Usage
First import package.
```dart
import 'package:dynamic_material_app/theme_data_bloc.dart';
```

Add the following line in ```main.dart```.
```dart
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
```

Add this widget as root widget.
```dart


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicMaterialApp(
      theme: ThemeData.light(), //You can give your custom light mode theme.
      
      darkTheme: ThemeData.dark(), //You can give your custom dark mode theme.
       
      home: Scaffold(),
    );
  }
}
```