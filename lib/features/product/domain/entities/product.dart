class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final bool fav;
  
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.fav = false,
  });

  Product copyWith(
    int? id,
    String? title,
    double? price,
    String? image,
    bool? fav
  ){
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      fav: fav ?? this.fav
    );
  }

  @override
  String toString() {
    return "Product(id: $id, title: $title, price: $price, image: $image, fav: $fav);";
  }
} 