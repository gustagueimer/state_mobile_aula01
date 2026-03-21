import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/features/product/domain/entities/product.dart';
import 'package:product_app/features/product/presentation/states/product_state_provider.dart';
import '../../domain/repositories/product_repository.dart';

class ProductViewModel {
  final ProductRepository repository;
  final WidgetRef ref;

  ProductViewModel(this.repository, this.ref);

  Future<void> loadProducts() async {
    ref.read(productStateNotifierProvider.notifier).changeLoading();
    try {
      final products = await repository.getProducts();
      repository.saveCache(products);
      ref.read(productStateNotifierProvider.notifier).changeProductList(products);
      ref.read(productStateNotifierProvider.notifier).changeLoading();
    } catch (e) {
      ref.read(productStateNotifierProvider.notifier).changeError(e.toString());
      ref.read(productStateNotifierProvider.notifier).changeLoading();
    }
  }

  MaterialColor fave(Product p) {
    if(p.fav == true) {
      return Colors.amber;
    }
    return Colors.grey;
  }
}