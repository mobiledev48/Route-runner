import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/edit_location_view/edit_location_screen.dart';
import 'package:route_runner/screens/google_location_view/google_location_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/screens/new_collection/new_collection_controller.dart';
import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/font_res.dart';
import 'package:route_runner/utils/strings.dart';

class NewCollectionScreen extends StatelessWidget {
  const NewCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewCollectionController newCollectionController = Get.put(NewCollectionController());
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<NewCollectionController>(id: 'collection',builder: (controller) {
              return  Column(
                children: [
                  Container(
                    height: Get.height * 0.13,
                    width: Get.width,
                    decoration: BoxDecoration(color: ColorRes.mainColor),
                    child: Padding(
                      padding: EdgeInsets.only(bottom:  Get.height * 0.02),
                      child: Column(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'New Collection',
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: ColorRes.white),
                                  ),
                                  Text(
                                    '',
                                    style: GoogleFonts.nunito(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
               Expanded(
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Column(children: [
                       SizedBox(height: 20,),
                       Row(
                         children: [
                           Expanded(
                             child: CommonTextField(
                                 isRequired: true,
                                 hintText: "#12",
                                 titleText: StringRes.machineNumber,
                                 controller: controller.machineNumberController),
                           ),
                           SizedBox(width: 20,),
                           Expanded(
                             child: CommonTextField(
                                 isRequired: true,
                                 hintText: StringRes.entersSerialNumber,
                                 titleText: StringRes.serialNumber,
                                 controller: controller.enterSerialNumberController),
                           ),
                         ],
                       ),
                       SizedBox(height: 20,),
                       CommonTextField(
                           isRequired: true,
                           hintText: "4652387645",
                           titleText: StringRes.auditsNumber,
                           controller: controller.auditNumberController),
                       SizedBox(height: 20,),
                       CommonTextField(
                           isRequired: true,
                           hintText: "\$2500",
                           titleText: StringRes.previousNumber,
                           controller: controller.auditNumberController),
                       SizedBox(height: 20,),
                       CommonTextField(
                           isRequired: true,
                           hintText: StringRes.enterCurrentNumber,
                           titleText: StringRes.currentNumber,
                           controller: controller.enterCurrentNumberController),
                       SizedBox(height: 20,),
                       Row(
                         children: [
                           Expanded(flex: 3,
                             child: GestureDetector(
                               onTap: () async {
                                await controller.getImageFromCamera();
                               },
                               child: Container(
                                 height: 40,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   color:  ColorRes.color5B93FF,
                                     border: Border.all(width: 1,color: ColorRes.color5B93FF),
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(10))),
                                 child: Row(
                                   children: [
                                     SizedBox(width: Get.width * 0.06,),
                                     Image.asset(AssetRes.camera,scale: 5,),
                                     SizedBox(width: 10,),
                                     Text(StringRes.captureMachineReading , style: GoogleFonts.nunito(
                                         fontSize: 14,
                                         fontWeight: FontWeight.w400,
                                         color:  ColorRes.white),),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           Spacer()
                         ],
                       ),
                       SizedBox(height: 20,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Expanded(
                               child: Container(
                                 height: 40,
                                 width: 180,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                     border: Border.all(width: 1,color: ColorRes.color5B93FF),
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(10))),
                                 child: Text(StringRes.close , style: GoogleFonts.nunito(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                     color:  ColorRes.color5B93FF),),
                               ),
                             ),
                             SizedBox(width: 10,),
                             Expanded(
                               child: Container(
                                 height: 40,
                                 width: 180,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                     color:  ColorRes.color5B93FF,
                                     border: Border.all(width: 1,color: ColorRes.color5B93FF),
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(10))),
                                 child: Text(StringRes.collect , style: GoogleFonts.nunito(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                     color:  ColorRes.white),),
                               ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(height: 20,),
                     ],),
                   ),

                 ),
               )
                ],
              );
            },)));
  }
}
