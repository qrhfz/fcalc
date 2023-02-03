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
          Flexible(
            flex: 8,
            child: ref.watch(showKeypadProv)
                ? const Keypad()
                : const FuncListView(),
          )
        ],
      ),
    );
  }
}

class FuncListView extends ConsumerWidget {
  const FuncListView({super.key});

  @override
  Widget build(context, ref) {
    final inputCtl = ref.watch(inputCtlProv);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: builtinFuncsList.length,
            itemBuilder: (c, i) {
              return ListTile(
                title: Text(builtinFuncsList[i].signature),
                subtitle: Text(builtinFuncsList[i].docs),
                onTap: () {
                  inputCtl.text += builtinFuncsList[i].signature;
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            onPressed: () {
              ref.read(showKeypadProv.notifier).state = true;
            },
            icon: const Icon(Icons.arrow_back),
          ),
        )
      ],
    );
  }
}

final showKeypadProv = StateProvider((ref) => true);
