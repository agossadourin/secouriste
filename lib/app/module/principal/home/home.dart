import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secouriste/app/core/instances.dart';

import 'package:secouriste/app/module/principal/home/widgets/alert_button.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const Text(
            'Police Républicaine',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.60,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Text(
            'En cas d\'urgence, appuyez sur le bouton d\'alerte pour joindre la patrouille la plus proche de votre position.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.60,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const AlertButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.black),
              Obx(
                () => GestureDetector(
                  onTap: () async {
                    //get user current location when tapped
                    Location location = Location();

                    bool serviceEnabled;
                    PermissionStatus permissionGranted;
                    LocationData locationData;

                    serviceEnabled = await location.serviceEnabled();
                    if (!serviceEnabled) {
                      serviceEnabled = await location.requestService();
                      if (!serviceEnabled) {
                        return;
                      }
                    }

                    permissionGranted = await location.hasPermission();
                    if (permissionGranted == PermissionStatus.denied) {
                      permissionGranted = await location.requestPermission();
                      if (permissionGranted != PermissionStatus.granted) {
                        return;
                      }
                    }

                    locationData = await location.getLocation();
                    principalController.currentLatitude.value =
                        locationData.latitude!;
                    principalController.currentLongitude.value =
                        locationData.longitude!;

                    String locationCity = await apiService.getCityName(
                        locationData.latitude!, locationData.longitude!);
                    principalController.currentLocation.value = locationCity;

                    print(
                        "Location: ${locationData.latitude}, ${locationData.longitude}");
                  },
                  child: Text(
                      principalController.currentLocation.value == ''
                          ? 'Tapez pour obtenir votre position'
                          : '(${principalController.currentLatitude}, ${principalController.currentLongitude}) ${principalController.currentLocation.value}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.60,
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
