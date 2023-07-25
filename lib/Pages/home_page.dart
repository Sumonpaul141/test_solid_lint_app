import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_application/Providers/providers.dart';
import 'package:test_application/app_values.dart';

/// This Is the page to show our expected Output
class HomePage extends ConsumerWidget {

  /// This Is the page to show our expected Output
  const HomePage({Key? key}) : super(key: key);

  Color _invert(Color color) {

    const maxColorValue = 255;

    return Color.fromARGB(
      (color.opacity * maxColorValue).round(),
      maxColorValue - color.red,
      maxColorValue - color.green,
      maxColorValue - color.blue,
    );

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color pickedColor = Colors.white;
    final color = ref.watch(colorProvider);

    Future<dynamic> showPickerDialog() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Change color"),
            content: ColorPicker(
              pickerColor: Colors.white,
              onColorChanged: (color) {
                pickedColor = color;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(colorProvider.notifier).color = pickedColor;
                  Navigator.pop(context);
                },
                child: const Text("Set"),
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Application"),
        actions: [
          GestureDetector(
            onTap: () => showPickerDialog(),
            child: const Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          ref.read(colorProvider.notifier).generateNewColor();
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: Center(
            child: Text(
              "Hello there",
              style: TextStyle(
                color: _invert(color),
                fontSize: AppValues.fontSize20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
