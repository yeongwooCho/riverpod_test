import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/layout/default_layout.dart';
import 'package:riverpod_test/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(fontSize: 24.0);

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            state1,
            style: textStyle,
          ),
          const SizedBox(height: 16.0),
          Text(
            state2.toString(),
            style: textStyle,
          ),
          const SizedBox(height: 16.0),
          state2.when(
            data: (data) {
              return Text(
                data.toString(),
                style: textStyle,
              );
            },
            error: (err, asdf) {
              return Text(err.toString());
            },
            loading: () {
              return Center(
                child: const CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
