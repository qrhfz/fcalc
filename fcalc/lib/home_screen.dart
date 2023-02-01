import 'dart:math';

import 'package:fcalc/history.dart';
import 'package:fcalc/input_controller.dart';
import 'package:fcalc/keypad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final scrollCtl = AutoScrollController();

  @override
  void dispose() {
    scrollCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputCtl = ref.watch(inputCtlProv);

    ref.listen(historyProv, (previous, next) {
      scrollCtl.scrollToIndex(max(0, next.length - 1));
    });
    final history = ref.watch(historyProv);

    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: scrollCtl,
                    itemCount: history.length,
                    itemBuilder: (ctx, i) {
                      final entry = history[i];
                      return AutoScrollTag(
                        index: i,
                        key: ValueKey(i),
                        controller: scrollCtl,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                entry.input,
                                style: const TextStyle(fontSize: 24),
                              ),
                              Text(
                                entry.result?.toString() ?? "",
                                style: const TextStyle(fontSize: 36),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                  ),
                ),
                TextField(
                  controller: inputCtl,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          const Flexible(
            flex: 3,
            child: Keypad(),
          ),
        ],
      ),
    );
  }
}
