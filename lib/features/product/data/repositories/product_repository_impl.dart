import 'package:product_app/core/errors/faliure.dart';
import 'package:product_app/features/product/data/datasources/product_cache_datasource.dart';

import '../../domain/repositories/product_repository.dart';
import '../../domain/entities/product.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remote;
  final ProductCacheDatasource cache;
    
  ProductRepositoryImpl(this.remote, this.cache);
    
  @override
  Future<List<Product>> getProducts() async {
    try{
      final models = await remote.getProducts();
      return models
      .map((m) => Product(
        id: m.id,
        title: m.title,
        price: m.price,
        image: m.image,
      ))
      .toList();
    } catch (e) {
      final cached = cache.get();
      if(cached != null) {
        return cached
        .map((m) => Product(
          id: m.id, 
          title: m.title, 
          price: m.price, 
          image: m.image
          ))
          .toList();
      }
      throw Failure("Não foi possível carregar os produtos");
    }
  }  
}