import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/shopping_item_model.dart';

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(ShoppingItemModel(
          name: '김치',
          quantity: 3,
          hasBought: false,
          isSpicy: true,
        ));

  void toggleHasBought() {
    state = ShoppingItemModel(
      name: state.name,
      quantity: state.quantity,
      hasBought: !state.hasBought,
      isSpicy: state.isSpicy,
    );
  }

  void toggleIsSpicy() {
    state = ShoppingItemModel(
      name: state.name,
      quantity: state.quantity,
      hasBought: state.hasBought,
      isSpicy: !state.isSpicy,
    );
  }
}
