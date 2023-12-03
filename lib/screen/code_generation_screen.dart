import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/layout/default_layout.dart';
import 'package:riverpod_test/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('CodeGenerationScreen build');

    const textStyle = TextStyle(fontSize: 24.0);

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 3,
      number2: 4,
    ));

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
          const SizedBox(height: 16.0),
          state3.when(
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
          const SizedBox(height: 16.0),
          Text(
            "state4: $state4",
            style: textStyle,
          ),
          const SizedBox(height: 16.0),
          // _StateFiveWidget(),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              print('Consumer builder build');
              final state5 = ref.watch(gStateNotifierProvider);

              return Row(
                children: [
                  Text(
                    "state5: $state5",
                    style: textStyle,
                  ),
                  if (child != null) child,
                ],
              );
            },
            child: Text('Hello'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('decrement'),
              ),
            ],
          ),
          // validate : 검증하다
          // invalidate: 유효하지 않게 하다
          // state를 모두 날리는 기능을 한다.
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text('Invalidate'),
          ),
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('_StateFiveWidget build');

    const textStyle = TextStyle(fontSize: 24.0);
    final state5 = ref.watch(gStateNotifierProvider);

    return Text(
      "state5: $state5",
      style: textStyle,
    );
  }
}
