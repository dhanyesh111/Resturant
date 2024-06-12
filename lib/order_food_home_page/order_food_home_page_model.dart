import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CategoryViseProducts {
  String categoryName;
  List<ProductModel> products;
  CategoryViseProducts({required this.products, required this.categoryName});
}

class ProductModel {
  String image;
  String name;
  String calories;
  String weight;
  String price;
  String description;
  RxInt itemCount;
  ProductModel({
    required this.image,
    required this.name,
    required this.calories,
    required this.weight,
    required this.price,
    required this.itemCount,
    required this.description,
  });
}

class CategoryModel {
  String image;
  String name;
  CategoryModel({
    required this.image,
    required this.name,
  });
}
