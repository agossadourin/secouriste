import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:secouriste/app/core/constants.dart';
import 'package:secouriste/app/core/instances.dart';
import 'package:secouriste/app/data/city.dart';

class AlertButton extends StatelessWidget {
  const AlertButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        principalController.isLoading.value = true;
        // Add your functionality here
        City city = await apiService.getNearestCity(
            principalController.citiesList,
            principalController.currentLatitude.value,
            principalController.currentLongitude.value);
        print(
            'nom de la ville: ${city.name} numéro de téléphone: ${city.number}');
        await FlutterPhoneDirectCaller.callNumber(city.number.toString());
        principalController.isLoading.value = false;
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
                        ? const CircularProgressIndicator()
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
