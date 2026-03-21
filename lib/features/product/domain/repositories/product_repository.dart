import '../entities/product.dart'; 

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  void saveCache(List<Product> products);
}