import 'package:dio/dio.dart';

import 'package:geolocator/geolocator.dart';
import 'package:secouriste/app/data/city.dart';

class ApiService {
  static ApiService instance = ApiService();

  //method for getting cities location

  final String apiKey = '';

  /*Future<City> getCityCoordinates(String cityName, int cityNumber) async {
    final String apiUrl = 'https://nominatim.openstreetmap.org/search';
    Dio dio = Dio();
    final response = await dio.get(apiUrl,
        queryParameters: {'q': cityName, 'format': 'json', 'limit': 1});

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      if (data.isNotEmpty) {
        final double latitude = double.parse(data[0]['lat']);
        final double longitude = double.parse(data[0]['lon']);
        City city = City(cityName, latitude, longitude, cityNumber);
        return city;
      } else {
        return City(cityName, 0, 0, cityNumber);
      }
    } else {
      throw Exception('Failed to load coordinates');
    }
  }*/

  /*Future<String> getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Location services are disabled.';
    }

    // Check for location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'Location permissions are denied.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return 'Location permissions are permanently denied, we cannot request permissions.';
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Use OpenStreetMap Nominatim API to get the address
    final String apiUrl =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}';
    final Dio dio = Dio();
    try {
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        String address = data['display_name'];
        return 'Current location: $address';
      } else {
        return 'Failed to get address from OpenStreetMap.';
      }
    } catch (e) {
      return 'Failed to get address: $e';
    }
  }*/

  Future<String> getCityName(double latitude, double longitude) async {
    final Dio dio = Dio();
    final String url =
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latitude&lon=$longitude';

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        if (data.containsKey('address')) {
          final address = data['address'];
          if (address.containsKey('city')) {
            return address['city'];
          } else if (address.containsKey('town')) {
            return address['town'];
          } else if (address.containsKey('village')) {
            return address['village'];
          } else if (address.containsKey('hamlet')) {
            return address['hamlet'];
          }
        }
        return 'Unknown city';
      } else {
        throw Exception('Failed to get city name');
      }
    } catch (e) {
      throw Exception('Failed to get city name: $e');
    }
  }

  //method for getting the nearest city to my current location, in the cities list
  Future<City> getNearestCity(List<City> cities, double currentLatitude,
      double currentLongitude) async {
    // Get the current position

    // Calculate the distance between the current position and each city
    double minDistance = double.infinity;
    City nearestCity = cities[0];
    for (City city in cities) {
      double distance = Geolocator.distanceBetween(
        currentLatitude,
        currentLongitude,
        city.latitude,
        city.longitude,
      );
      if (distance < minDistance) {
        minDistance = distance;
        nearestCity = city;
      }
    }

    return nearestCity;
  }

  //send email method that send a mail to given email, containing maps link to user location and a message
  /*Future<void> sendEmail(String email, double latitude, double longitude) async {
    final String subject = 'Emergency';
    final String body =
        'I need help. Here is my location: https://www.openstreetmap.org/?mlat=$latitude&mlon=$longitude#map=15/$latitude/$longitude';
    final String url = 'mailto:$email?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/

  Future<void> sendMail(String email, double latitude, double longitude) async {
    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const String serviceId = 'service_bawxbjv';
    const String templateId = 'template_31dll64';
    const String userId = 'S_cDRZPOgUweCxJa1';
    final String body =
        'I need help. Here is my location: https://www.openstreetmap.org/?mlat=$latitude&mlon=$longitude#map=15/$latitude/$longitude \n if you use google maps: https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    // dio post

    try {
      final response = await Dio().post(
        url.toString(),
        data: {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'message': body,
            'to_email': email,
          },
        },
        options: Options(headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        }),
      );
      print(
          "*************************email sent successfully*************************");
      print(response.data);
    } catch (e) {
      print("*************************email not sent*************************");
      print(e);
    }
  }

  //sending sms
  /*Future<void> sendSmsMessage(
      List<String> recipients, double latitude, double longitude) async {
    final String body =
        'I need help. Here is my location: https://www.openstreetmap.org/?mlat=$latitude&mlon=$longitude#map=15/$latitude/$longitude \n if you use google maps: https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    try {
      await sendSMS(message: body, recipients: recipients);
    } catch (e) {
      print('Failed to send SMS: $e');
    }
  }*/
}
