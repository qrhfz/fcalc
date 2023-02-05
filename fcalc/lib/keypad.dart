import 'dart:math';

import 'package:fcalc/calculate.dart';
import 'package:fcalc/home_screen.dart';
import 'package:fcalc/input_controller.dart';
import 'package:fcalc/vibrate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Keypad extends ConsumerStatefulWidget {
  const Keypad({
    super.key,
  });

  @override
  ConsumerState<Keypad> createState() => _KeypadState();
}

class _KeypadState extends ConsumerState<Keypad> {
  late TextEditingController inputCtl;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => inputCtl = ref.watch(inputCtlProv));
  }

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ExpandedRow(
          children: [
            KeypadButton(
              text: "𝑓",
              onPressed: () {
                ref.read(showKeypadProv.notifier).state = false;
              },
            ),
            KeypadButton(text: "e", onPressed: insertText("e")),
            KeypadButton(text: "π", onPressed: insertText("π")),
            KeypadButton(text: "°", onPressed: insertText("°")),
            KeypadButton(
              icon: const Icon(Icons.backspace),
              text: "",
              onPressed: del,
            ),
          ],
        ),
        ExpandedRow(children: [
          KeypadButton(text: "7", onPressed: insertText("7")),
          KeypadButton(text: "8", onPressed: insertText("8")),
          KeypadButton(text: "9", onPressed: insertText("9")),
          KeypadButton(text: "/", onPressed: insertText("/")),
          KeypadButton(text: "^", onPressed: insertText("^")),
        ]),
        ExpandedRow(
          children: [
            KeypadButton(text: "4", onPressed: insertText("4")),
            KeypadButton(text: "5", onPressed: insertText("5")),
            KeypadButton(text: "6", onPressed: insertText("6")),
            KeypadButton(text: "×", onPressed: insertText("×")),
            KeypadButton(text: "!", onPressed: insertText("!")),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: "1", onPressed: insertText("1")),
            KeypadButton(text: "2", onPressed: insertText("2")),
            KeypadButton(text: "3", onPressed: insertText("3")),
            KeypadButton(text: "-", onPressed: insertText("-")),
            KeypadButton(text: "%", onPressed: insertText("%")),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: "0", onPressed: insertText("0")),
            KeypadButton(text: "(", onPressed: insertText("(")),
            KeypadButton(text: ")", onPressed: insertText(")")),
            KeypadButton(text: "+", onPressed: insertText("+")),
            KeypadButton(text: "=", onPressed: insertText("=")),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: ".", onPressed: insertText(".")),
            KeypadButton(text: ",", onPressed: insertText(",")),
            KeypadButton(
              text: "",
              icon: const Icon(Icons.arrow_left),
              onPressed: () {
                final inputCtl = ref.read(inputCtlProv);
                final newOffset = max(0, inputCtl.selection.baseOffset - 1);
                inputCtl.selection = inputCtl.selection.copyWith(
                  baseOffset: newOffset,
                  extentOffset: newOffset,
                );
              },
            ),
            KeypadButton(
              text: "",
              icon: const Icon(Icons.arrow_right),
              onPressed: () {
                final inputCtl = ref.read(inputCtlProv);
                final newOffset = min(
                    inputCtl.text.length, inputCtl.selection.baseOffset + 1);
                inputCtl.selection = inputCtl.selection.copyWith(
                  baseOffset: newOffset,
                  extentOffset: newOffset,
                );
              },
            ),
            KeypadButton(
              text: "",
              icon: const Icon(Icons.subdirectory_arrow_left),
              onPressed: enter,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }

  Function() insertText(String text) => () {
        final pos = inputCtl.selection.baseOffset;
        if (pos == -1) {
          inputCtl.text += text;
        } else {
          inputCtl.text = inputCtl.text.substring(0, pos) +
              text +
              inputCtl.text.substring(pos, inputCtl.text.length);
        }
        moveCursor(pos + text.length);
      };

  void del() {
    if (inputCtl.text.isEmpty) {
      return;
    }
    final pos = inputCtl.selection.baseOffset;
    if (pos == -1 || pos == inputCtl.text.length) {
      inputCtl.text = inputCtl.text.substring(0, inputCtl.text.length - 1);
      moveCursor(inputCtl.text.length);
      return;
    }
    inputCtl.text = inputCtl.text.substring(0, pos - 1) +
        inputCtl.text.substring(pos, inputCtl.text.length);

    moveCursor(pos - 1);
  }

  void moveCursor(int pos) {
    inputCtl.selection =
        inputCtl.selection.copyWith(baseOffset: pos, extentOffset: pos);
  }

  void enter() {
    final src = inputCtl.text;
    ref.read(calculateProv)(src);
    inputCtl.clear();
  }

  void func() {}
}

class KeypadButton extends ConsumerWidget {
  const KeypadButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.flex = 1,
    this.backgroundColor,
    super.key,
  });
  final void Function() onPressed;
  final String text;
  final Icon? icon;
  final int flex;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, ref) {
    final buttonStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 24),
      ),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
    );
    return Builder(builder: (context) {
      return Expanded(
        flex: flex,
        child: Container(
          color: backgroundColor,
          child: icon == null
              ? TextButton(
                  style: buttonStyle,
                  child: Text(text),
                  onPressed: () async {
                    await ref.read(vibratorProv).vibrate();
                    onPressed();
                  },
                )
              : TextButton.icon(
                  icon: IconTheme(
                      data: Theme.of(context)
                          .iconTheme
                          .copyWith(color: Colors.white),
                      child: icon!),
                  label: Text(text),
                  onPressed: () async {
                    await ref.read(vibratorProv).vibrate();
                    onPressed();
                  },
                ),
        ),
      );
    });
  }
}

class ExpandedRow extends StatelessWidget {
  const ExpandedRow({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
