import 'package:get/get.dart';
import 'package:restaurant/add_new_upi/add_new_upi_controller.dart';
import 'package:restaurant/add_new_upi/add_new_upi_view.dart';

import '../add_new_card/add_new_card_controller.dart';
import '../add_new_card/add_new_card_view.dart';
import '../app_routes/app_routes.dart';
import '../billing/billing_controller.dart';
import '../billing/billing_view.dart';
import '../cart/cart_controller.dart';
import '../cart/cart_view.dart';
import '../confirm_table/confirm_table_controller.dart';
import '../confirm_table/confirm_table_view.dart';
import '../food_details/food_details_controller.dart';
import '../food_details/food_details_view.dart';
import '../food_listing/food_listing_controller.dart';
import '../food_listing/food_listing_view.dart';
import '../login/login_controller.dart';
import '../login/login_view.dart';
import '../manage_payment_methods/manage_payment_methods_controller.dart';
import '../manage_payment_methods/manage_payment_methods_view.dart';
import '../notification/notification_controller.dart';
import '../notification/notification_view.dart';
import '../onboarding/onboarding_controller.dart';
import '../onboarding/onboarding_view.dart';
import '../order_food_home_page/order_food_home_page_controller.dart';
import '../order_food_home_page/order_food_home_page_view.dart';
import '../order_food_onboarding/order_food_onboarding_controller.dart';
import '../order_food_onboarding/order_food_onboarding_view.dart';
import '../otp/otp_controller.dart';
import '../otp/otp_view.dart';
import '../payment_methods/payment_methods_controller.dart';
import '../payment_methods/payment_methods_view.dart';
import '../previous_order/previous_order_controller.dart';
import '../previous_order/previous_order_view.dart';
import '../profile/profile_controller.dart';
import '../profile/profile_view.dart';
import '../register/register_controller.dart';
import '../register/register_view.dart';
import '../reservation_listing/reservation_listing_controller.dart';
import '../reservation_listing/reservation_listing_view.dart';
import '../reserve_table/reserve_table_controller.dart';
import '../reserve_table/reserve_table_view.dart';
import '../reserve_table_onboarding/reserve_table_onboarding_controller.dart';
import '../reserve_table_onboarding/reserve_table_onboarding_view.dart';
import '../select_restaurant/select_restaurant_controller.dart';
import '../select_restaurant/select_restaurant_view.dart';
import '../select_table/select_table_controller.dart';
import '../select_table/select_table_view.dart';
import '../splash/splash_controller.dart';
import '../splash/splash_view.dart';
import '../track_order/track_order_controller.dart';
import '../track_order/track_order_view.dart';
import '../type_selection/type_selection_controller.dart';
import '../type_selection/type_selection_view.dart';

class AppPages {
  static List<GetPage> appPages = <GetPage>[
    GetPage(
        name: AppRoutes.billing,
        page: () => const BillingScreen(),
        binding: BillingControllerBinding()),
    GetPage(
        name: AppRoutes.cart,
        page: () => const CartScreen(),
        binding: CartControllerBinding()),
    GetPage(
        name: AppRoutes.confirmTable,
        page: () => const ConfirmTableScreen(),
        binding: ConfirmTableControllerBinding()),
    GetPage(
        name: AppRoutes.foodDetails,
        page: () => const FoodDetailsScreen(),
        binding: FoodDetailsControllerBinding()),
    GetPage(
        name: AppRoutes.foodListing,
        page: () => const FoodListingScreen(),
        binding: FoodListingControllerBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginControllerBinding()),
    GetPage(
        name: AppRoutes.managePaymentMethods,
        page: () => const ManagePaymentMethodsScreen(),
        binding: ManagePaymentMethodsControllerBinding()),
    GetPage(
        name: AppRoutes.notification,
        page: () => const NotificationScreen(),
        binding: NotificationControllerBinding()),
    GetPage(
        name: AppRoutes.onboarding,
        page: () => const OnboardingScreen(),
        binding: OnboardingControllerBinding()),
    GetPage(
        name: AppRoutes.orderFoodHomePage,
        page: () => const OrderFoodHomePageScreen(),
        binding: OrderFoodHomePageControllerBinding()),
    GetPage(
        name: AppRoutes.orderFoodOnboarding,
        page: () => const OrderFoodOnboardingScreen(),
        binding: OrderFoodOnboardingControllerBinding()),
    GetPage(
        name: AppRoutes.otp,
        page: () => const OtpScreen(),
        binding: OtpControllerBinding()),
    GetPage(
        name: AppRoutes.paymentMethods,
        page: () => const PaymentMethodsScreen(),
        binding: PaymentMethodsControllerBinding()),
    GetPage(
        name: AppRoutes.previousOrder,
        page: () => const PreviousOrderScreen(),
        binding: PreviousOrderControllerBinding()),
    GetPage(
        name: AppRoutes.profile,
        page: () => const ProfileScreen(),
        binding: ProfileControllerBinding()),
    GetPage(
        name: AppRoutes.register,
        page: () => const RegisterScreen(),
        binding: RegisterControllerBinding()),
    GetPage(
        name: AppRoutes.reservationListing,
        page: () => const ReservationListingScreen(),
        binding: ReservationListingControllerBinding()),
    GetPage(
        name: AppRoutes.addNewCard,
        page: () => const AddNewCardView(),
        binding: AddNewCardBinding()),
    GetPage(
        name: AppRoutes.addNewUpi,
        page: () => const AddNewUpiView(),
        binding: AddNewUpiBinding()),
    GetPage(
        name: AppRoutes.reserveTable,
        page: () => const ReserveTableScreen(),
        binding: ReserveTableControllerBinding()),
    GetPage(
        name: AppRoutes.reserveTableOnboarding,
        page: () => const ReserveTableOnboardingScreen(),
        binding: ReserveTableOnboardingControllerBinding()),
    GetPage(
        name: AppRoutes.selectRestaurant,
        page: () => const SelectRestaurantScreen(),
        binding: SelectRestaurantControllerBinding()),
    GetPage(
        name: AppRoutes.selectTable,
        page: () => const SelectTableScreen(),
        binding: SelectTableControllerBinding()),
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashControllerBinding()),
    GetPage(
        name: AppRoutes.trackOrder,
        page: () => const TrackOrderScreen(),
        binding: TrackOrderControllerBinding()),
    GetPage(
        name: AppRoutes.typeSelection,
        page: () => const TypeSelectionScreen(),
        binding: TypeSelectionControllerBinding()),
  ];
}
