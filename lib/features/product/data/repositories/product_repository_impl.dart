import 'package:product_app/core/errors/faliure.dart';
import 'package:product_app/features/product/data/datasources/product_cache_datasource.dart';
import 'package:product_app/features/product/data/models/product_model.dart';

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
      final cached = cache.get();
      if(cached != null) {
        return cached
        .map((m) => Product(
          id: m.id, 
          title: m.title, 
          price: m.price, 
          image: m.image,
          fav: m.fav,
          ))
          .toList();
      }
      final models = await remote.getProducts();
      return models
      .map((m) => Product(
        id: m.id,
        title: m.title,
        price: m.price,
        image: m.image,
        fav: m.fav,
      ))
      .toList();
    } catch (e) {
      throw Failure("Não foi possível carregar os produtos");
    }
  }

  @override
  void saveCache(List<Product> products) {
    cache.save(products
     .map((p) => ProductModel(
        id: p.id, 
        title: p.title, 
        price: p.price, 
        image: p.image,
        fav: p.fav
      ))
      .toList()
    );
    
  }  
}