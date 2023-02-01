import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputCtlProv = Provider.autoDispose((ref) {
  final ctl = TextEditingController();

  ref.onDispose(() => ctl.dispose());

  return ctl;
});
