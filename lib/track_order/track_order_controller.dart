import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/assets/icons.dart';

class TrackOrderControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}

class TrackOrderController extends GetxController {
  static TrackOrderController get to => Get.find();

  String? response;
  void onInit() async {
    super.onInit();
    isLoading.value = true;

    restaurantIcon = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(AppIcons.dineIn, 150));
    destinationIcon = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(AppIcons.destination, 150));
    driverIcon = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(AppIcons.driver, 150));
    await Geolocator.requestPermission();

    driverLatitude.value = 11.277984692759214;
    driverLongitude.value = 75.784782975851;
    restaurantLongitude = 75.80978227838939;
    restaurantLatitude = 11.269960006390962;
    destinationLongitude = 75.82913481576895;
    destinationLatitude = 11.253811818954134;
    // Position currentLocation = await Geolocator.getCurrentPosition();
    // destinationLongitude = currentLocation.longitude;
    // destinationLatitude = currentLocation.latitude;

    points.addAll(await getPolyLines(
        startLocation:
            LatLng(driverLatitude.value ?? 0, driverLongitude.value ?? 0),
        endLocation:
            LatLng(restaurantLatitude ?? 0, restaurantLongitude ?? 0)));
    points.addAll(await getPolyLines(
        startLocation:
            LatLng(restaurantLatitude ?? 0, restaurantLongitude ?? 0),
        endLocation:
            LatLng(destinationLatitude ?? 0, destinationLongitude ?? 0)));
    response = await rootBundle.loadString('assets/map_theme/mapTheme.json');
    isLoading.value = false;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  BitmapDescriptor? restaurantIcon;
  BitmapDescriptor? destinationIcon;
  BitmapDescriptor? driverIcon;
  RxBool isLoading = false.obs;
  double? destinationLatitude;
  double? destinationLongitude;
  double? restaurantLatitude;
  double? restaurantLongitude;
  Rx<double?> driverLatitude = Rx<double?>(null);
  Rx<double?> driverLongitude = Rx<double?>(null);
  RxList<LatLng> points = <LatLng>[].obs;
  GoogleMapController? googleMapController;

  Future<Iterable<LatLng>> getPolyLines({
    required LatLng startLocation,
    required LatLng endLocation,
  }) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCVABxXIQXAwUax1Y-6RilICoA4KsuEvlM",
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
    );
    print(result.status);
    return result.points
        .map((point) => LatLng(point.latitude, point.longitude));
  }
}
