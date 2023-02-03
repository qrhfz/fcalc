import 'dart:math';

import 'package:fcalc/calculate.dart';
import 'package:fcalc/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

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
            KeypadButton(text: "𝑓", onPressed: func),
            KeypadButton(text: "e", onPressed: e),
            KeypadButton(text: "π", onPressed: pi),
            KeypadButton(text: "°", onPressed: degree),
            KeypadButton(
              icon: const Icon(Icons.backspace),
              text: "",
              onPressed: del,
            ),
          ],
        ),
        ExpandedRow(children: [
          KeypadButton(text: "7", onPressed: seven),
          KeypadButton(text: "8", onPressed: eight),
          KeypadButton(text: "9", onPressed: nine),
          KeypadButton(text: "/", onPressed: divide),
          KeypadButton(text: "^", onPressed: power),
        ]),
        ExpandedRow(
          children: [
            KeypadButton(text: "4", onPressed: four),
            KeypadButton(text: "5", onPressed: five),
            KeypadButton(text: "6", onPressed: six),
            KeypadButton(text: "×", onPressed: times),
            KeypadButton(text: "!", onPressed: factorial),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: "2", onPressed: two),
            KeypadButton(text: "3", onPressed: three),
            KeypadButton(text: "1", onPressed: one),
            KeypadButton(text: "-", onPressed: minus),
            KeypadButton(text: "%", onPressed: percent),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: "0", onPressed: zero),
            KeypadButton(text: "(", onPressed: lParen),
            KeypadButton(text: ")", onPressed: rParen),
            KeypadButton(text: "+", onPressed: plus),
            KeypadButton(text: "=", onPressed: equal),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: ".", onPressed: dot),
            KeypadButton(text: ",", onPressed: comma),
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

  void lParen() => inputCtl.text += "(";

  void rParen() => inputCtl.text += ")";

  void percent() => inputCtl.text += "%";

  void del() {
    if (inputCtl.text.isEmpty) {
      return;
    }
    inputCtl.text = inputCtl.text.substring(0, inputCtl.text.length - 1);
  }

  void seven() => inputCtl.text += "7";

  void eight() => inputCtl.text += "8";

  void nine() => inputCtl.text += "9";

  void divide() => inputCtl.text += "/";

  void four() => inputCtl.text += "4";

  void five() => inputCtl.text += "5";

  void six() => inputCtl.text += "6";

  void times() => inputCtl.text += '×';

  void one() => inputCtl.text += '1';

  void two() => inputCtl.text += '2';

  void three() => inputCtl.text += '3';

  void minus() => inputCtl.text += '-';

  void zero() => inputCtl.text += '0';

  void dot() => inputCtl.text += '.';

  void equal() => inputCtl.text += '=';

  void plus() => inputCtl.text += '+';

  void power() => inputCtl.text += '^';

  void factorial() => inputCtl.text += '!';

  void degree() => inputCtl.text += '°';

  void enter() {
    final src = inputCtl.text;
    ref.read(calculateProv)(src);
    inputCtl.clear();
  }

  void pi() => inputCtl.text += 'π';

  void comma() => inputCtl.text += ',';

  void func() {}

  void e() {
    inputCtl.text += 'e';
  }

  void space() {
    inputCtl.text += ' ';
  }
}

class KeypadButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                  onPressed: _press,
                  child: Text(text),
                )
              : TextButton.icon(
                  onPressed: onPressed,
                  icon: IconTheme(
                      data: Theme.of(context)
                          .iconTheme
                          .copyWith(color: Colors.white),
                      child: icon!),
                  label: Text(text),
                ),
        ),
      );
    });
  }

  void _press() async {
    if (await Vibration.hasVibrator() == true) {
      Vibration.vibrate(duration: 65);
    }
    onPressed();
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
