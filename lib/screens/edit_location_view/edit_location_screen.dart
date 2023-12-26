import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/edit_location_view/edit_location_controller.dart';
import 'package:route_runner/utils/font_res.dart';

class EditLScreen extends StatelessWidget {
  const EditLScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditLController controller = Get.put(EditLController());
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizeH(h: 20),
            Center(
              child: Text(
                "Add Location Screen",
                style: GoogleFonts.glory(),
              ),
            ),
            textFiledView(controller, context),
          ],
        ),
      ),
    ));
  }

  Widget textFiledView(EditLController editLController, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: editLController.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: editLController.enterLocation.value,
              style: GoogleFonts.glory(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Address Name',
                  labelStyle: GoogleFonts.glory(fontSize: 15)),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: editLController.passwordC.value,
              style: GoogleFonts.glory(fontSize: 15),
              decoration: InputDecoration(
                labelText: 'Machine1',
                labelStyle: GoogleFonts.glory(fontSize: 15),
              ),

            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                      .withOpacity(0.5), // Set the background color here
                ),
                onPressed: () {},
                child: Text(
                  'Add Location',
                  style: GoogleFonts.glory(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
