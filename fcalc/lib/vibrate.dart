import 'dart:io' show Platform;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

class Vibrator {
  bool? _hasVibrator;

  Future<void> vibrate() async {
    if (!Platform.isAndroid) {
      return;
    }

    if (_hasVibrator == null) {
      await _check();
    }

    if (_hasVibrator == true) {
      Vibration.vibrate(duration: 65);
    }
  }

  Future<void> _check() async {
    _hasVibrator = await Vibration.hasVibrator();
  }
}

final vibratorProv = Provider((ref) => Vibrator());
