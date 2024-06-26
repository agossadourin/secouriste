import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:secouriste/app/core/constants.dart';
import 'package:secouriste/app/data/city.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key, required this.city});
  final City? city;

  @override
  Widget build(BuildContext context) {
    //list tile with city name and phone number, and a button to call
    return Column(
      children: [
        ListTile(
          title: Text(
            ' Coridor ${city!.name}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('contact: ${city!.number}'),
          trailing: IconButton(
            color: primaryColor,
            icon: const Icon(Icons.phone),
            onPressed: () {
              Get.dialog(AlertDialog(
                title: Text('Appeler ${city!.name}'),
                content: Text('Voulez-vous appeler ${city!.name}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Get.back(); // Close the dialog
                      /*final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: city!.number
                            .toString(), // Assuming city.number contains the phone number
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launch(launchUri as String);
                      } else {
                        // Handle the error or show a message if the phone number can't be dialed
                        print('Could not launch $launchUri');
                      }*/
                      await FlutterPhoneDirectCaller.callNumber(
                          city!.number.toString());

                      //call function
                    },
                    child: const Text('Appeler'),
                  ),
                ],
              ));
            },
          ),
        ),
        //line to separate
        const Divider(),
      ],
    );
  }
}
