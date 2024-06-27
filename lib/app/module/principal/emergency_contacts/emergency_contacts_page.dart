import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secouriste/app/module/principal/emergency_contacts/controllers/emergency_contact_controller.dart';
import 'package:secouriste/app/module/principal/emergency_contacts/edit_emergency_contact_page.dart';
// Make sure to import your controller

class EmergencyContactsPage extends StatelessWidget {
  final EmergencyContactController controller =
      Get.find<EmergencyContactController>();

  EmergencyContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${controller.name}',
                    style: const TextStyle(fontSize: 18)),
                Text('Number: ${controller.number}',
                    style: const TextStyle(fontSize: 18)),
                Text('Email: ${controller.email}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => EditEmergencyContactsPage());
                    // Implement your editing logic here
                    // For example, show a dialog or navigate to another page where the user can edit the information
                  },
                  child: const Text('Edit Contact'),
                ),
              ],
            ),
          )),
    );
  }
}
