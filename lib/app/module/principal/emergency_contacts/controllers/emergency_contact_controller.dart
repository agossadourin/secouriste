import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyContactController extends GetxController {
  var name = ''.obs;
  var number = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadEmergencyContact();
  }

  Future<void> loadEmergencyContact() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('emergencyContactName') ?? 'No Name';
    number.value = prefs.getString('emergencyContactNumber') ?? 'No Number';
    email.value = prefs.getString('emergencyContactEmail') ?? 'No Email';
  }

  Future<void> saveEmergencyContact(
      String newName, String newNumber, String newEmail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('emergencyContactName', newName);
    await prefs.setString('emergencyContactNumber', newNumber);
    await prefs.setString('emergencyContactEmail', newEmail);
    name.value = newName;
    number.value = newNumber;
    email.value = newEmail;
  }
}
