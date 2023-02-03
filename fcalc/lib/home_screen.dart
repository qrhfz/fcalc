import 'dart:math';

import 'package:fcalc/history.dart';
import 'package:fcalc/input_controller.dart';
import 'package:fcalc/keypad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'calculate.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late final TabController tabCtl;
  final focus = FocusNode();

  @override
  void initState() {
    super.initState();
    tabCtl = TabController(length: 3, vsync: this, initialIndex: 1);

    tabCtl.addListener(() {
      if (tabCtl.index == 0) {
        focus.requestFocus();
      } else {
        focus.unfocus();
      }
    });
  }

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
                  focusNode: focus,
                  controller: inputCtl,
                  textAlign: TextAlign.end,
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
          TabBar(
            controller: tabCtl,
            tabs: const [
              Tab(icon: Icon(Icons.keyboard)),
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.functions)),
            ],
          ),
          Flexible(
            flex: 8,
            child: TabBarView(
              controller: tabCtl,
              children: const [
                SizedBox(),
                Keypad(),
                Text('functions'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultView extends ConsumerStatefulWidget {
  const ResultView({super.key});

  @override
  ConsumerState<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends ConsumerState<ResultView> {
  final scrollCtl = AutoScrollController();

  @override
  void dispose() {
    scrollCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(historyProv, (previous, next) {
      scrollCtl.scrollToIndex(max(0, next.length - 1));
    });

    final history = ref.watch(historyProv);
    return ListView.separated(
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
    );
  }
}
