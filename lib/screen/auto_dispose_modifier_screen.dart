import 'package:flutter/material.dart';
import 'package:riverpod_test/layout/default_layout.dart';

class AutoDisposeModifierScreen extends StatelessWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'AutoDisposeModifierScreen',
      body: Center(
        child: Text(''),
      ),
    );
  }
}
