import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_application/Notifiers/color_notifier.dart';

/// this is the color value provider for managing the state
final colorProvider = StateNotifierProvider.autoDispose<ColorNotifier, Color>(
      (ref) => ColorNotifier(Colors.white),
);
