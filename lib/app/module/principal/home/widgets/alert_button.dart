import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:secouriste/app/core/constants.dart';
import 'package:secouriste/app/core/instances.dart';
import 'package:secouriste/app/data/city.dart';
import 'package:secouriste/app/module/principal/emergency_contacts/controllers/emergency_contact_controller.dart';

class AlertButton extends StatelessWidget {
  const AlertButton({super.key});

  void _launchCall() async {
    // Add your functionality here
    City city = await apiService.getNearestCity(
        principalController.citiesList,
        principalController.currentLatitude.value,
        principalController.currentLongitude.value);
    print('nom de la ville: ${city.name} numéro de téléphone: ${city.number}');
    await FlutterPhoneDirectCaller.callNumber(city.number.toString());
    await apiService.sendMail(
        Get.find<EmergencyContactController>().email.value,
        principalController.currentLatitude.value,
        principalController.currentLongitude.value);

    principalController.isLoading.value = false;
    print('timer end');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (principalController.timer.value == null) {
          // Start the timer
          principalController.isLoading.value = true;
          print('started timer');
          principalController.timer.value =
              Timer.periodic(const Duration(seconds: 1), (timer) {
            principalController.remainingTime.value =
                principalController.remainingTime.value - 1;
            print('timer: ${principalController.remainingTime.value}');
            if (principalController.remainingTime.value == 0) {
              principalController.remainingTime.value = 5;
              _launchCall();
              principalController.timer.value!.cancel();
              principalController.timer.value = null;
            }
          });
        } else {
          // Cancel the timer and reset it
          principalController.remainingTime.value = 5;
          principalController.isLoading.value = false;
          principalController.timer.value!.cancel();
          principalController.timer.value = null;
        }
        // start a chrono of five seconds. If the user doesn't cancel the alert, _lauchCall will be called. To cancel, user must press the button again
      },
      child: Material(
        elevation: 4.0, // Adjust elevation as needed
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.4), // Creates a circle shape
        child: Container(
          width:
              MediaQuery.of(context).size.width * 0.7, // Adjust size as needed
          height:
              MediaQuery.of(context).size.width * 0.7, // Adjust size as needed
          decoration: const BoxDecoration(
            color: Colors.white, // Background color of the outer circle
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Obx(() => Container(
                width: MediaQuery.of(context).size.width *
                    0.65, // Adjust size as needed
                height: MediaQuery.of(context).size.width *
                    0.65, // Adjust size as needed
                decoration: BoxDecoration(
                  color: principalController.isLoading.value == true
                      ? Colors.blueGrey
                      : primaryColor, // Color of the inner circle
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: principalController.isLoading.value
                        ? Text(
                            principalController.remainingTime.value.toString(),
                            style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        : Icon(
                            Icons.phone,
                            color: Colors.white, // Color of the icon
                            size: MediaQuery.of(context).size.width *
                                0.3, // Adjust size as needed
                          )))),
          ),
        ),
      ),
    );
  }
}
