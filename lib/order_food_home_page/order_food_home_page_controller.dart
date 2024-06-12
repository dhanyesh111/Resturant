import 'package:get/get.dart';

import 'order_food_home_page_model.dart';

class OrderFoodHomePageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderFoodHomePageController());
  }
}

class OrderFoodHomePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static OrderFoodHomePageController get to => Get.find();
  @override
  void onInit() {
    super.onInit();
  }

  List<String> offerList = [
    "https://cdn.grabon.in/gograbon/images/web-images/uploads/1618575517942/food-coupons.jpg",
    "https://cdn.grabon.in/gograbon/images/category/1546252575451.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkDywmTpZSEITJgRnza1mHhChSUXVDY5khOg&s",
    "https://i0.wp.com/ecomeye.com/wp-content/uploads/2021/08/freshmenu.jpg?fit=512%2C265&ssl=1",
  ];

  RxBool isSortOptionVisible = false.obs;
  List<String> sortOptions = [
    "Price",
    "Cooking Time",
    "Delivery Time",
    "Popularity",
    "Discount"
  ];

  List<CategoryViseProducts> products = [
    CategoryViseProducts(categoryName: "Frequent Order", products: [
      ProductModel(
        image:
            "https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg",
        name: 'Noodles',
        calories: '200',
        weight: '300',
        itemCount: 0.obs,
        price: '200',
        description:
            'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
      ),
      // ProductModel(
      //   image:
      //       "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      //   name: 'Noodles',
      //   calories: '200',
      //   weight: '300',
      //   itemCount: 0.obs,
      //   price: '200',
      //   description:
      //       'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
      // ),
      // ProductModel(
      //   image:
      //       "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      //   name: 'Noodles',
      //   calories: '200',
      //   weight: '300',
      //   itemCount: 0.obs,
      //   price: '200',
      //   description:
      //       'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
      // ),
      // ProductModel(
      //   image:
      //       "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      //   name: 'Noodles',
      //   calories: '200',
      //   weight: '300',
      //   itemCount: 0.obs,
      //   price: '200',
      //   description:
      //       'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
      // ),
    ]),
    // CategoryViseProducts(categoryName: "Veg", products: [
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    // ]),
    // CategoryViseProducts(categoryName: "Fish", products: [
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    // ]),
    // CategoryViseProducts(categoryName: "Egg", products: [
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    // ]),
    // CategoryViseProducts(categoryName: "Meals", products: [
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    // ]),
    // CategoryViseProducts(categoryName: "Chines", products: [
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    //   ProductModel(
    //     image:
    //         "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
    //     name: 'Noodles',
    //     calories: '200',
    //     weight: '300',
    //     itemCount: 0.obs,
    //     price: '200',
    //     description:
    //         'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    //   ),
    // ]),
  ];
  List<CategoryModel> categories = [
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
    CategoryModel(
        image:
            "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
        name: "Chinese"),
  ];

  List<ProductModel> recommendedItems = [
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
  ];
  List<ProductModel> combinationBreakFast = [
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
  ];
  List<ProductModel> combinationLunch = [
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
  ];
  RxInt index = 0.obs;

  RxInt endIndex = 2.obs;

  List<ProductModel> combinationDinner = [
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
  ];
  List<ProductModel> combinationSnacks = [
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
    ProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: 'Noodles and Honey chicken',
      calories: '200',
      weight: '300',
      itemCount: 0.obs,
      price: '200',
      description:
          'Noodles are a type of food made from unleavened dough which is either rolled flat and cut, stretched, into long strings. Noodles are a staple food in many cultures and made into a variety of shapes. The most common noodles are either those derived from Chinese cuisine or Italian cuisine.',
    ),
  ];
  List<String> tagLines = [
    "Fast, Fresh, Instant",
    "Order, Eat, Enjoy",
    "Any thing, Any Where, Any Time"
  ];
}
