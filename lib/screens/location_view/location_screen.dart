import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/edit_location_view/edit_location_screen.dart';
import 'package:route_runner/screens/google_location_view/google_location_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/utils/font_res.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController controller = Get.put(LocationController());
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'Location List',
                style: GoogleFonts.glory(fontSize: 25),
              ), automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(onTap: () {
                    Get.to(const EditLScreen());
                  },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),

              ],
            ),
            body: GetBuilder<LocationController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.searchController,
                      style: GoogleFonts.glory(),
                      onChanged: (value) {
                        controller.filterLocations(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Search Locations',
                        labelStyle: GoogleFonts.glory(),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    sizeH(h: 15),
                    controller.filteredLocations!.isNotEmpty? Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.filteredLocations!.length,
                        itemBuilder: (context, index) {
                          var data = controller.filteredLocations![index].locationname;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  Get.to(GoogleLocationScreen(
                                    locationText: data,
                                  ));
                                },
                                child: ListTile(
                                  title: Text(
                                    data!,
                                    style: GoogleFonts.glory(),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.black26,
                                height: 1,
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      ),
                    ):const SizedBox(),
                  ],
                ),
              );
            },)));
  }
}
