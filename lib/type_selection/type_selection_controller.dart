import 'package:get/get.dart';
import 'package:restaurant/assets/icons.dart';
import 'package:restaurant/type_selection/type_selection_model.dart';

class TypeSelectionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeSelectionController());
  }
}

class TypeSelectionController extends GetxController {
  static TypeSelectionController get to => Get.find();
  List<TypeSelectionItemModel> availableOptions = [
    TypeSelectionItemModel(image: AppIcons.dineIn, text: "Dine In"),
    TypeSelectionItemModel(image: AppIcons.bookCatering, text: "Book Catering"),
    TypeSelectionItemModel(image: AppIcons.reserveTable, text: "Reserve Table"),
    TypeSelectionItemModel(image: AppIcons.bookDelivery, text: "Book Delivery"),
  ];
  List<OtherServicesItemModel> otherServices = [
    OtherServicesItemModel(
      heading: "Dine-in Service",
      services: [
        "Table reservations",
        "Private dining rooms",
        "Family-friendly dining areas",
        "Outdoor seating"
      ],
    ),
    OtherServicesItemModel(heading: "Food and Beverage Services", services: [
      "appetizers",
      "entrees",
      "desserts",
      "Scocktails",
      "mocktails",
      "coffee",
      "tea"
          "Wine and beer selection",
      "Kids menu",
      " Vegetarian, vegan",
      "gluten-free options"
    ]),
    OtherServicesItemModel(heading: "Takeout and Delivery", services: [
      "Online ordering",
      "Curbside pickup",
      "Home delivery service",
    ]),
    OtherServicesItemModel(heading: "Special Events and Catering", services: [
      "birthdays",
      "anniversaries",
      "corporate events",
      "Catering for off-site events",
      " Customizable event menus",
      " Private event planning",
    ]),
    OtherServicesItemModel(heading: "Customer Amenities", services: [
      "Free Wi-Fi",
      "Parking facilities",
      "Accessibility for disabled guests",
      "High chairs and booster seats",
    ]),
    OtherServicesItemModel(heading: "Entertainment", services: [
      "Live music or DJ",
      " Televised sports events",
      "trivia",
      "karaoke"
    ]),
    OtherServicesItemModel(
        heading: "Loyalty Programs and Promotions",
        services: ["Membership rewards", "Discount offers ", " Gift cards"]),
    OtherServicesItemModel(heading: "Health and Safety Measures", services: [
      "Sanitization and hygiene practices",
      "Contactless payment options"
    ])
  ];
}
