import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:route_runner/utils/font_res.dart';

// ignore: must_be_immutable
class GoogleLocationScreen extends StatefulWidget {
  String? locationText;

  GoogleLocationScreen({super.key, this.locationText});

  @override
  State<GoogleLocationScreen> createState() => _GoogleLocationScreenState();
}

class _GoogleLocationScreenState extends State<GoogleLocationScreen> {
  GoogleMapController? _controller;
  final LatLng _initialCameraPosition = const LatLng(37.7749, -122.4194);
  LocationPermission? permission;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    determinePosition();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              sizeH(),
              Text(
                widget.locationText!,
                style: GoogleFonts.glory(),
              ),
              SizedBox(
                height: Get.height - 250,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _initialCameraPosition,
                    zoom: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
