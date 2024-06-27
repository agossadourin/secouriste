import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secouriste/app/core/constants.dart';
import 'package:secouriste/app/module/principal/emergency_contacts/controllers/emergency_contact_controller.dart';

class EditEmergencyContactsPage extends StatelessWidget {
  EditEmergencyContactsPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier le contact d\'urgence'),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // show current info of the emergency contact

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: numberController,
                    decoration: const InputDecoration(
                      labelText: 'Number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8),
                  //button to save the emergency contact
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      Get.find<EmergencyContactController>()
                          .saveEmergencyContact(
                              nameController.text.isEmpty
                                  ? Get.find<EmergencyContactController>()
                                      .name
                                      .value
                                  : nameController.text,
                              numberController.text.isEmpty
                                  ? Get.find<EmergencyContactController>()
                                      .number
                                      .value
                                  : numberController.text,
                              emailController.text.isEmpty
                                  ? Get.find<EmergencyContactController>()
                                      .email
                                      .value
                                  : emailController.text);
                      Get.find<EmergencyContactController>()
                          .loadEmergencyContact();
                      Get.back();
                      Get.showSnackbar(const GetSnackBar(
                        title: 'Contact d\'urgence modifié',
                        message:
                            'Le contact d\'urgence a été modifié avec succès',
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      ));
                    },
                    child: const Text('Sauvegarder',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
            ),
            // Here you can add your ListView.builder for contacts
            // Example:
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: yourContactsList.length,
            //     itemBuilder: (context, index) {
            //       return YourContactWidget(contact: yourContactsList[index]);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
