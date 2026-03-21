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

  @override
  String toString() {
    return "Product(id: $id, title: $title, price: $price, image: $image, fav: $fav);";
  }
} 