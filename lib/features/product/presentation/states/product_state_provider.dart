import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/features/product/domain/entities/product.dart';
import 'package:product_app/features/product/presentation/states/product_state.dart';

class ProductStateNotifier extends Notifier<ProductState> {

  @override
  ProductState build() {
    return ProductState();
  }

  void changeLoading() {
    if(state.isLoading) {
      state = state.copyWith(isLoading: false);
      return;
    }
    state = state.copyWith(isLoading: true);
  }

  void changeProductList(List<Product> products) {
    state = state.copyWith(products: products);
  }

  void changeError(String error) {
    state = state.copyWith(error: error);
  }
}

final productStateNotifierProvider = NotifierProvider<ProductStateNotifier, ProductState>(() {
    return ProductStateNotifier();
  }
);