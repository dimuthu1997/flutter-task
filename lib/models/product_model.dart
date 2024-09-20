class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  double? rating;
  String? brand;
  String? thumbnail;
  List<String>? images;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.rating,
      this.brand,
      this.thumbnail,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    brand = json['brand'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }
}

class ProductsResponse {
  List<Product>? products;
  int? total;

  ProductsResponse({this.products, this.total});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    total = json['total'];
  }
}
