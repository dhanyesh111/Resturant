import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/track_order/track_order_controller.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetX<TrackOrderController>(builder: (controller) {
      return controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            )
          : Stack(
              children: [
                GoogleMap(
                  style: TrackOrderController.to.response,
                  onMapCreated:
                      (GoogleMapController googleMapController) async {
                    TrackOrderController.to.googleMapController =
                        googleMapController;
                    print(await googleMapController.getStyleError());
                  },
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        TrackOrderController.to.destinationLatitude ?? 0,
                        TrackOrderController.to.destinationLongitude ?? 0,
                      ),
                      zoom: 15),
                  polylines: {
                    Polyline(
                      polylineId: PolylineId("route"),
                      points: controller.points,
                      color: AppColors.red183,
                      width: 4,
                    )
                  },
                  markers: {
                    Marker(
                        markerId: const MarkerId("Hotel"),
                        icon: controller.restaurantIcon!,
                        position: LatLng(
                            TrackOrderController.to.restaurantLatitude ?? 0,
                            TrackOrderController.to.restaurantLongitude ?? 0)),
                    Marker(
                        markerId: const MarkerId("Destination"),
                        icon: controller.destinationIcon!,
                        position: LatLng(
                            TrackOrderController.to.destinationLatitude ?? 0,
                            TrackOrderController.to.destinationLongitude ?? 0)),
                    Marker(
                        markerId: const MarkerId("Driver"),
                        icon: controller.driverIcon!,
                        position: LatLng(
                            TrackOrderController.to.driverLatitude.value ?? 0,
                            TrackOrderController.to.driverLongitude.value ?? 0))
                  },
                ),
                DraggableScrollableSheet(
                  minChildSize: .2,
                  initialChildSize: .2,
                  maxChildSize: .95,
                  builder: (BuildContext context, scrollController) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverList.list(children: const [
                            ListTile(title: Text('Jane Doe')),
                            ListTile(title: Text('Jack reacher')),
                          ])
                        ],
                      ),
                    );
                  },
                )
              ],
            );
    }));
  }
}
//
