import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// Color notifier class for notify and manage the state of the color
class ColorNotifier extends StateNotifier<Color> {


  /// Get color
  /// This is added to remove the waring 'Setter used without getter'
  /// This getter is not mandatory because we will watch this
  /// value using provider ref
  Color get color => state;

  /// Set color
  set color(Color color){
    state = color;
  }
  /// Setting value through constructor
  ColorNotifier(super.state);

  /// this method will generate new colors each time you call this,
  void generateNewColor() {
    const colorCharacter = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'A',
      'B',
      'C',
      'D',
      'E',
      'F'
    ];
    const colorString = "FF";
    const maxColorHexLength = 6;
    final StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write(colorString);
    for (int i = 0; i < maxColorHexLength; i++) {
      final randomNumber = Random().nextInt(colorCharacter.length);
      stringBuffer.write(colorCharacter[randomNumber]);
    }
    final colorValue = int.parse(stringBuffer.toString(), radix: 16);
    state = Color(colorValue);
  }

}
