import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/admin_view/admin_controller.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Admin Login',
          style: GoogleFonts.glory(fontSize: 25),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Stack(
                children: [
                  textFiledView(adminController, context),
                  adminController.loader.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox()
                ],
              ))),
    );
  }

  Widget textFiledView(AdminController adminController, BuildContext context) {
    return Form(
      key: adminController.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: adminController.email.value,
            style: GoogleFonts.glory(fontSize: 15),
            decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: GoogleFonts.glory(fontSize: 15)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: adminController.passwordC.value,
            style: GoogleFonts.glory(fontSize: 15),
            decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: GoogleFonts.glory(fontSize: 15),
                suffixIcon: GestureDetector(
                    onTap: () {
                      adminController.onTapOb();
                    },
                    child: Icon(
                      adminController.obText.isTrue
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ))),
            obscureText: adminController.obText.isTrue ? true : false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
                    .withOpacity(0.5), // Set the background color here
              ),
              onPressed: () {
                adminController.loginOnTap(context);
              },
              child:  Text('Login',style: GoogleFonts.glory(fontSize: 15),),
            ),
          ),
        ],
      ),
    );
  }
}
