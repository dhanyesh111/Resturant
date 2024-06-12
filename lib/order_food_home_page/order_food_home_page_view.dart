import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_routes/app_routes.dart';
import 'package:restaurant/flip_card/flip_card.dart';
import 'package:restaurant/onboarding/onboarding_view.dart';
import 'package:restaurant/order_food_home_page/order_food_home_page_controller.dart';

import '../animated_text/animated_text.dart';
import '../app_bar/app_bars.dart';
import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';
import '../app_network_image/app_network_image.dart';
import '../custom_animated_switcher.dart';
import 'order_food_home_page_model.dart';

class OrderFoodHomePageScreen extends StatelessWidget {
  const OrderFoodHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomePageAppBar(
          deliveryLocation: "Calicut, Palazi",
          actions: [
            Icon(
              Icons.notifications,
              size: 35.sp,
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 30.sp),
          children: [
            SearchTextBox(),
            SizedBox(
              height: 30.sp,
            ),
            OfferList(),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MENU",
                  style: TextStyle(color: AppColors.white),
                ),
                const SortButton()
              ],
            ),
            DefaultTabController(
                length: OrderFoodHomePageController.to.products.length,
                child: Column(
                  children: [
                    TabBar(
                        enableFeedback: true,
                        labelPadding: EdgeInsets.only(right: 25.sp),
                        dividerColor: AppColors.black32,
                        indicatorColor: AppColors.red183,
                        labelColor: AppColors.white,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w600),
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        tabs: OrderFoodHomePageController.to.products
                            .map((category) => Tab(text: category.categoryName))
                            .toList()),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Container(
                      height: 302.sp,
                      child: TabBarView(
                          children: OrderFoodHomePageController.to.products
                              .map(
                                (products) => ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: products.products
                                      .map((product) =>
                                          MainProductView(product: product))
                                      .toList(),
                                ),
                              )
                              .toList()),
                    )
                  ],
                )),
            SizedBox(
              height: 20.sp,
            ),
            Categories(),
            SizedBox(
              height: 20.sp,
            ),
            RecommendedItems(),
            SizedBox(
              height: 20.sp,
            ),
            CombinationBreakFast(),
            SizedBox(
              height: 20.sp,
            ),
            CombinationLunch(),
            SizedBox(
              height: 20.sp,
            ),
            CombinationDinner(),
            SizedBox(
              height: 20.sp,
            ),
            CombinationSnacks(),
            SizedBox(
              height: 60.sp,
            ),
            TagLine()
          ],
        ));
  }
}

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended Items",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            height: 290.sp,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: OrderFoodHomePageController.to.recommendedItems
                  .map((product) =>
                      RecommendedItemsListingItem(product: product))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TagLine extends StatelessWidget {
  const TagLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "JUST SAVOUR\nDON'T WORRY !!",
          style: TextStyle(
              fontSize: 40.sp,
              height: 1,
              color: AppColors.white.withOpacity(.5),
              fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Obx(() {
          return TweenAnimationBuilder(
            tween: IntTween(
                begin: 0, end: OrderFoodHomePageController.to.endIndex.value),
            onEnd: () => OrderFoodHomePageController.to.endIndex.value == 2
                ? OrderFoodHomePageController.to.endIndex.value = 0
                : OrderFoodHomePageController.to.endIndex.value = 2,
            duration: const Duration(seconds: 30),
            builder: (BuildContext context, int value, Widget? child) {
              return AnimatedText(
                text: OrderFoodHomePageController.to.tagLines[value],
                key: ValueKey(OrderFoodHomePageController.to.tagLines[value]),
                style: TextStyle(color: AppColors.white, fontSize: 20.sp),
              );
            },
          );
        })
      ],
    );
  }
}

class RecommendedItemsListingItem extends StatelessWidget {
  ProductModel product;

  RecommendedItemsListingItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.sp),
      child: Stack(
        children: [
          Container(
            height: 240.sp,
            width: 200.sp,
            decoration: BoxDecoration(
                color: AppColors.black32,
                borderRadius: BorderRadius.circular(10.sp)),
            margin: EdgeInsets.only(top: 50.sp),
          ),
          Container(
            width: 200.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppNetworkImage(
                  imageUrl: product.image,
                  radius: 100.sp,
                  height: 140.sp,
                  width: 140.sp,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Container(
                  width: 150.sp,
                  height: 48.sp,
                  child: Text(
                    product.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "₹ ${product.price}",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProductViewItemBuilder(
                      text: product.calories,
                      icon: Icon(
                        Icons.generating_tokens_sharp,
                        color: AppColors.white.withOpacity(.5),
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    ProductViewItemBuilder(
                      text: product.weight,
                      icon: Icon(
                        Icons.ac_unit_rounded,
                        color: AppColors.white.withOpacity(.5),
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddToCartButton(itemCount: product.itemCount),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CombinationBreakFast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Combination BreakFast",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          child: Column(
            children: OrderFoodHomePageController.to.combinationBreakFast
                .map((product) => CombinationListingItem(product: product))
                .toList(),
          ),
        )
      ],
    );
  }
}

class CombinationLunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Combination Lunch",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          child: Column(
            children: OrderFoodHomePageController.to.combinationLunch
                .map((product) => CombinationListingItem(product: product))
                .toList(),
          ),
        )
      ],
    );
  }
}

class CombinationDinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Combination Dinner",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          child: Column(
            children: OrderFoodHomePageController.to.combinationDinner
                .map((product) => CombinationListingItem(product: product))
                .toList(),
          ),
        )
      ],
    );
  }
}

class CombinationSnacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Combination Snacks",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          child: Column(
            children: OrderFoodHomePageController.to.combinationSnacks
                .map((product) => CombinationListingItem(product: product))
                .toList(),
          ),
        )
      ],
    );
  }
}

class CombinationListingItem extends StatelessWidget {
  ProductModel product;

  CombinationListingItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      firstChild: CombinationListingItemFrontSide(product: product),
      secondChild: CombinationListingItemBackSide(product: product),
    );
  }
}

class CombinationListingItemFrontSide extends StatelessWidget {
  ProductModel product;

  CombinationListingItemFrontSide({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.sp),
        child: Container(
          height: 125.sp,
          width: Get.width,
          color: AppColors.black32,
          child: Row(
            children: [
              AppNetworkImage(
                imageUrl: product.image,
                height: 125.sp,
                width: 110.sp,
              ),
              SizedBox(
                width: 15.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                width: 250.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Row(
                          children: [
                            ProductViewItemBuilder(
                              text: product.calories,
                              icon: Icon(
                                Icons.generating_tokens_sharp,
                                color: AppColors.white.withOpacity(.5),
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 20.sp,
                            ),
                            ProductViewItemBuilder(
                              text: product.weight,
                              icon: Icon(
                                Icons.ac_unit_rounded,
                                color: AppColors.white.withOpacity(.5),
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${product.price}",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        AddToCartButton(itemCount: product.itemCount),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CombinationListingItemBackSide extends StatelessWidget {
  ProductModel product;

  CombinationListingItemBackSide({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.sp),
        child: Container(
          padding: EdgeInsets.all(20.sp),
          height: 125.sp,
          width: Get.width.sp,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: CachedNetworkImageProvider(product.image),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(.5),
              BlendMode.darken,
            ),
          )),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
              child: Text(
                product.description,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          height: 250.sp,
          child: GridView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 110.sp / 95.sp),
            children: OrderFoodHomePageController.to.categories
                .map((category) => CategoryListingContainer(category: category))
                .toList(),
          ),
        )
      ],
    );
  }
}

class CategoryListingContainer extends StatelessWidget {
  CategoryModel category;

  CategoryListingContainer({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppNetworkImage(
          imageUrl: category.image,
          radius: 100.sp,
          height: 90.sp,
          width: 90.sp,
        ),
        SizedBox(
          height: 2.sp,
        ),
        Text(
          category.name,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}

class MainProductView extends StatelessWidget {
  ProductModel product;

  MainProductView({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.sp),
      child: FlipCard(
          onTap: () => Get.toNamed(AppRoutes.foodDetails, arguments: product),
          firstChild: ProductCardFrontView(product: product),
          secondChild: ProductCardBackView(product: product)),
    );
  }
}

class ProductCardFrontView extends StatelessWidget {
  ProductModel product;

  ProductCardFrontView({required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.sp),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(product.image),
                colorFilter: ColorFilter.mode(
                    AppColors.black32.withOpacity(.5), BlendMode.darken))),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.image,
                child: AppNetworkImage(
                  width: 220.sp,
                  height: 200.sp,
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 220.sp,
                padding:
                    EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: AppColors.white),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      children: [
                        ProductViewItemBuilder(
                          text: product.calories,
                          icon: Icon(
                            Icons.generating_tokens_sharp,
                            color: AppColors.white.withOpacity(.5),
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        ProductViewItemBuilder(
                          text: product.weight,
                          icon: Icon(
                            Icons.ac_unit_rounded,
                            color: AppColors.white.withOpacity(.5),
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${product.price}",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        AddToCartButton(itemCount: product.itemCount),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardBackView extends StatelessWidget {
  ProductModel product;

  ProductCardBackView({required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.sp),
      child: Container(
        padding: EdgeInsets.all(20.sp),
        height: 305.sp,
        width: 220.sp,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: CachedNetworkImageProvider(product.image),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(.5),
            BlendMode.darken,
          ),
        )),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
            child: Text(
              product.description,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}

class ProductViewItemBuilder extends StatelessWidget {
  Widget icon;
  String text;

  ProductViewItemBuilder({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        icon,
        Text(
          text,
          style: TextStyle(
              fontSize: 12.sp, color: AppColors.white.withOpacity(.5)),
        )
      ],
    );
  }
}

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          OrderFoodHomePageController.to.isSortOptionVisible.value = true,
      child: Row(
        children: [
          GetX<OrderFoodHomePageController>(builder: (controller) {
            return CustomAnimatedIcon(
                firstChild: Icon(
                  Icons.arrow_left_rounded,
                  color: AppColors.white,
                ),
                secondChild: Icon(
                  Icons.arrow_left_rounded,
                  color: AppColors.white,
                  key: ValueKey("icon1"),
                ),
                value:
                    OrderFoodHomePageController.to.isSortOptionVisible.value);
          }),
          GetX<OrderFoodHomePageController>(builder: (controller) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (Widget child,
                        Animation<double> animation) =>
                    SizeTransition(
                      axis: Axis.horizontal,
                      sizeFactor:
                          Tween<double>(begin: 0, end: 1).animate(animation),
                      child: child,
                    ),
                child: controller.isSortOptionVisible.value
                    ? SizedBox(
                        height: 30.sp,
                        width: 280.sp,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: controller.sortOptions
                              .map((sortItem) => SortOptionsListingContainer(
                                    sortItem: sortItem,
                                  ))
                              .toList(),
                        ),
                      )
                    : Text(
                        "SORT",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600),
                      ));
          }),
          GetX<OrderFoodHomePageController>(builder: (controller) {
            return CustomAnimatedIcon(
                firstChild: Icon(
                  Icons.arrow_right_rounded,
                  color: AppColors.white,
                ),
                secondChild: Icon(
                  Icons.arrow_right_rounded,
                  color: AppColors.white,
                  key: ValueKey("icon1"),
                ),
                value:
                    OrderFoodHomePageController.to.isSortOptionVisible.value);
          }),
        ],
      ),
    );
  }
}

class SortOptionsListingContainer extends StatelessWidget {
  String sortItem;

  SortOptionsListingContainer({required this.sortItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OrderFoodHomePageController.to.isSortOptionVisible.value = false;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.sp),
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        decoration: BoxDecoration(
            color: AppColors.blue, borderRadius: BorderRadius.circular(5.sp)),
        child: Text(
          sortItem,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
      ),
    );
  }
}

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.sp,
      width: Get.width,
      child: PageView(
        children: OrderFoodHomePageController.to.offerList
            .map((e) => ParallaxView(
                  isHorizontal: true,
                  child: Container(
                    height: 200.sp,
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
                    child: AppNetworkImage(
                      imageUrl: e,
                      radius: 10.sp,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class SearchTextBox extends StatelessWidget {
  const SearchTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          label: AnimatedText(
            text: "Enter any text to search ...",
            style: TextStyle(fontSize: 18.sp),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.white,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
          floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}
