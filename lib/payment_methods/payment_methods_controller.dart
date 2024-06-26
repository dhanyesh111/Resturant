import 'package:get/get.dart';
import 'package:restaurant/assets/icons.dart';
import 'package:restaurant/payment_methods/payment_methods_model.dart';

class PaymentMethodsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodsController());
  }
}

class PaymentMethodsController extends GetxController {
  static PaymentMethodsController get to => Get.find();
  Rx<PaymentMethodsModel?> selectedPayment = Rx<PaymentMethodsModel?>(null);
  List<PaymentMethodsModel> preferredPayment = <PaymentMethodsModel>[
    PaymentMethodsModel(
        name: 'HDFC Bank card ',
        icon: AppIcons.visa,
        subText: 'XXXX-XXXX-XXXX-1234'),
    PaymentMethodsModel(
        name: 'Pay on Delivery',
        icon: AppIcons.cashOnDelivery,
        subText:
            'Pay cash to delivery partner or ask for QR code to pay via upi'),
    PaymentMethodsModel(
        name: 'Amazon pay', icon: AppIcons.amazonPay, subText: '')
  ];
  List<PaymentMethodsModel> upiApp = <PaymentMethodsModel>[
    PaymentMethodsModel(
        name: 'Google pay', icon: AppIcons.googlePay, subText: 'xxx_xxx_@hdfc'),
    PaymentMethodsModel(
        name: 'Airtal Pay', icon: AppIcons.airtalPay, subText: ''),
    PaymentMethodsModel(
        name: 'Bajaj Pay', icon: AppIcons.bajajPay, subText: ''),
    PaymentMethodsModel(
        name: 'Phone Pay', icon: AppIcons.phonePay, subText: ''),
    PaymentMethodsModel(name: 'Paytm', icon: AppIcons.paytm, subText: ''),
  ];
  List<PaymentMethodsModel> creditAndDebitCard = <PaymentMethodsModel>[
    PaymentMethodsModel(
        name: 'HDFC Bank card ',
        icon: AppIcons.visa,
        subText: 'XXXX-XXXX-XXXX-1234'),
    PaymentMethodsModel(
        name: 'HDFC Bank card ',
        icon: AppIcons.visa,
        subText: 'XXXX-XXXX-XXXX-6243'),
    PaymentMethodsModel(
        name: 'HDFC Bank card ',
        icon: AppIcons.masterCard,
        subText: 'XXXX-XXXX-XXXX-1454'),
  ];
  RxBool viewAllUpi = false.obs;
  RxBool viewAllCreditAndDebitCard = false.obs;
}
