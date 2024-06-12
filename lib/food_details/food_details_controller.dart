import 'package:get/get.dart';
import 'package:restaurant/order_food_home_page/order_food_home_page_model.dart';

import 'food_details_model.dart';

class FoodDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodDetailsController());
  }
}

class FoodDetailsController extends GetxController {
  static FoodDetailsController get to => Get.find();
  @override
  void onInit() {
    super.onInit();
    ProductModel product = Get.arguments;
    productImage = product.image;
    productName = product.name;
    productPrice = product.price;
    description = product.description;
    calories = product.calories;
    weight = product.weight;
  }

  String? productImage;
  String? productName;
  String? fat;
  int? rating;
  String? productPrice;
  String? offerPrice;
  String? description;
  String? calories;
  String? weight;

  List<String> ingredients = [
    "Pre boiled Rice ( idil-dosa rice )",
    "Salt",
    "Whole Urad Dal",
    "Coconut Oil"
  ];
  List<ReviewModel> reviews = [
    ReviewModel(
        userName: "Asif Muhammed",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7ZeiBqb0LXy2n7ERZ0B1oFgqvZnD-w_8OA&s",
        review:
            "Need more choices, and in the morning should open before 7.30. It needs to either have a buffet service or faster serving time. It also needs to reduce mistakes in taking orders.",
        rating: 4),
    ReviewModel(
        userName: "Asif Muhammed",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7ZeiBqb0LXy2n7ERZ0B1oFgqvZnD-w_8OA&s",
        review:
            "Need more choices, and in the morning should open before 7.30. It needs to either have a buffet service or faster serving time. It also needs to reduce mistakes in taking orders.",
        rating: 4),
    ReviewModel(
        userName: "Asif Muhammed",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7ZeiBqb0LXy2n7ERZ0B1oFgqvZnD-w_8OA&s",
        review:
            "Need more choices, and in the morning should open before 7.30. It needs to either have a buffet service or faster serving time. It also needs to reduce mistakes in taking orders.",
        rating: 4),
    ReviewModel(
        userName: "Asif Muhammed",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7ZeiBqb0LXy2n7ERZ0B1oFgqvZnD-w_8OA&s",
        review:
            "Need more choices, and in the morning should open before 7.30. It needs to either have a buffet service or faster serving time. It also needs to reduce mistakes in taking orders.",
        rating: 4),
    ReviewModel(
        userName: "Asif Muhammed",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7ZeiBqb0LXy2n7ERZ0B1oFgqvZnD-w_8OA&s",
        review:
            "Need more choices, and in the morning should open before 7.30. It needs to either have a buffet service or faster serving time. It also needs to reduce mistakes in taking orders.",
        rating: 4),
    ReviewModel(
        userName: "Asif Muhammed",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7ZeiBqb0LXy2n7ERZ0B1oFgqvZnD-w_8OA&s",
        review:
            "Need more choices, and in the morning should open before 7.30. It needs to either have a buffet service or faster serving time. It also needs to reduce mistakes in taking orders.",
        rating: 4),
  ];
  RxInt itemCount = 0.obs;
}
