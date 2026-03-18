import 'package:product_app/features/product/data/models/product_model.dart';

class ProductCacheDatasource {
  List<ProductModel>? _cache;

  void save(List<ProductModel> products) {
    _cache = products;
  }

  List<ProductModel>? get() {
    return _cache;
  }

}