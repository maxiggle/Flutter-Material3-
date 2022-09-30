import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_material3/task.dart';

void main() {
  runApp(const MyApp());
}

Color defaultColor = Color(0XFF420420);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColor;
      ColorScheme darkColor;

      if (lightDynamic != null && darkDynamic != null) {
        /// [ColorScheme] can be null if the os does not support dynamic color
        /// or if the os does not respond
        // lightColor = lightDynamic.harmonized().copyWith();
        lightColor =
            lightDynamic.harmonized().copyWith(secondary: defaultColor);
        darkColor = darkDynamic.harmonized();
      } else {
        //if our phone does not support Android 12, it can fall on this
        lightColor = ColorScheme.fromSeed(seedColor: defaultColor);
        darkColor = ColorScheme.fromSeed(
            seedColor: defaultColor, brightness: Brightness.dark);
      }
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          useMaterial3: true,
          colorScheme: lightColor,
        ),
        home: ToDoApp(),
      );
    });
  }
}
