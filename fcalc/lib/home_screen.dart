import 'package:fcalc/builtin_funcs_list.dart';
import 'package:fcalc/input_controller.dart';
import 'package:fcalc/keypad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calculate.dart';
import 'result_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final focus = FocusNode();
  bool showKeypad = true;
  @override
  Widget build(BuildContext context) {
    final inputCtl = ref.watch(inputCtlProv);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: Column(
              children: [
                const Expanded(child: ResultView()),
                TextField(
                  keyboardType: TextInputType.none,
                  autofocus: true,
                  controller: inputCtl,
                  showCursor: true,
                  style: const TextStyle(fontSize: 24),
                  onSubmitted: (_) {
                    final src = inputCtl.text;
                    ref.read(calculateProv)(src);
                    inputCtl.clear();
                  },
                  onEditingComplete: () {
                    focus.requestFocus();
                  },
                ),
              ],
            ),
          ),
          if (showKeypad)
            const Flexible(
              flex: 8,
              child: Keypad(),
            )
          else
            ListView.builder(
              itemCount: builtinFuncsList.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(builtinFuncsList[i].signature),
                  subtitle: Text(builtinFuncsList[i].docs),
                );
              },
            ),
        ],
      ),
    );
  }
}
