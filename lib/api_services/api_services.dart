class ApiServices {
  //
  //  static printResponse(
  //     {required String url,
  //     Map<String, dynamic>? body,
  //     Map<String, dynamic>? queryParameter,
  //     required http.Response response}) {
  //   if (kDebugMode) {
  //     print(Uri.https(AppUrls.base, url, queryParameter ?? {}));
  //     if (body != null) {
  //       log("${Uri.https(AppUrls.base, url)}====>$body");
  //     }
  //     log("${Uri.https(AppUrls.base, url)}====>${response.statusCode}");
  //     log("${Uri.https(AppUrls.base, url)}====>${response.body}");
  //   }
  // }

  // static checkNetworkConnection() async {
  //   if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
  //     Get.showSnackbar(const GetSnackBar(
  //         duration: Duration(seconds: 5),
  //         backgroundColor: Colors.transparent,
  //         padding: EdgeInsets.zero,
  //         messageText: AppSnackBar(text: "Please check internet Connection")));
  //     throw Exception("No Network");
  //   }
  // }
//   static String getToken() {
//       String token = box.read(BoxKeys.token);
//   return "Bearer $token";
// }

  // static Future<T> login(Map<String, String> queryParameter) async {
  //        await checkNetworkConnection();
  //   var response =
  //       await http.post(Uri.https(AppUrls.base, AppUrls.login, queryParameter));
  //   printResponse(
  //       url: AppUrls.login, response: response, queryParameter: queryParameter);
  //   if (response.statusCode == 200) {
  //     return loginResponseModelResponseModelFromJson(response.body);
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }
  //
  // static Future<T> purchaseMembershipPackage({required Map<String, dynamic> body}) async {
  //   await checkNetworkConnection();
  //   var response = await http.post(
  //     Uri.https(AppUrls.base, AppUrls.purchaseMembershipPackage),
  //     body: json.encode(body),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': getToken(),
  //     },
  //   );
  //   printResponse(
  //       url: AppUrls.purchaseMembershipPackage, response: response, body: body);
  //   if (response.statusCode == 200) {
  //     return purchaseMembershipPackageResponseModelFromJson(response.body);
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }
}
