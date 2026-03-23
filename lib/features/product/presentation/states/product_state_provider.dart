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

  void changeFav(Product p, bool? favState) {
    if (!state.products.contains(p)) {
      return;
    }
    int idx = state.products.lastIndexWhere((product) => product.id == p.id);
    /*
    state.products.removeAt(idx);
    state.products.add(Product(id: p.id, price: p.price, title: p.title, image: p.image, fav: favState!)); 
    */
    state.products[idx] = state.products.elementAt(idx).copyWith(p.id, p.title, p.price, p.image, favState);
    print(state.products.elementAt(idx).toString());
  }
}

final productStateNotifierProvider = NotifierProvider<ProductStateNotifier, ProductState>(() {
    return ProductStateNotifier();
  }
);