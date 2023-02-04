import 'dart:math';

import 'history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
                if (entry.result != null)
                  Text(
                    entry.result!.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                if (entry.error != null)
                  Text(
                    entry.error!.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "monospace",
                    ),
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
