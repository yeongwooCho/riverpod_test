import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/riverpod/state_notifier_provider.dart';

final filteredShoppingList = Provider(
  (ref) => ref.watch(shoppingListProvider),
);
