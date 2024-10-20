import 'dart:async';

import 'package:get/get.dart';
import 'package:secouriste/app/data/city.dart';

class PrincipalController extends GetxController {
  static PrincipalController instance = Get.find();
  RxInt currentPage = 0.obs;
  RxInt remainingTime = 3.obs;

//init data method. This method call api service to get the cities coordinates of the cities in the data list and store them in the cities list
  /*Future<void> initData() async {
    for (int i = 0; i < data.length; i++) {
      final city = data[i];
      final cityName = city.keys.first;
      final cityNumber = city.values.first;
      City cityCoordinates =
          await apiService.getCityCoordinates(cityName, cityNumber);
      print(
          'name: ${cityCoordinates.name} latitude: ${cityCoordinates.latitude} longitude: ${cityCoordinates.longitude} number: ${cityCoordinates.number}');
      cities.value.add(cityCoordinates);
    }
  }*/

  Rx<List<City>> cities = Rx<List<City>>([]);

  Rx<String> currentLocation = Rx<String>('');
  RxDouble currentLatitude = 0.0.obs;
  RxDouble currentLongitude = 0.0.obs;
  RxBool isLoading = false.obs;
  Rx<Timer?> timer = Rx<Timer?>(null);

  List<City> citiesList = [
    City(
        name: "Sékou",
        latitude: 6.6361649,
        longitude: 2.2270883,
        number: 99772643),
    City(
        name: "Allada",
        latitude: 6.6658411,
        longitude: 2.1511876,
        number: 58397025),
    City(
        name: "Houègbo",
        latitude: 6.8047076,
        longitude: 2.1738016,
        number: 98749915),
    City(
        name: "Sehouè",
        latitude: 6.9258324,
        longitude: 2.2711315,
        number: 63903563),
    City(
        name: "Massi",
        latitude: 6.9712893,
        longitude: 2.2407881,
        number: 60605356),
    City(
        name: "Zoukou",
        latitude: 7.3865267,
        longitude: 2.4999133,
        number: 60605354),
    City(
        name: "zogbodomè",
        latitude: 7.0682962,
        longitude: 2.1187793,
        number: 60605349),
    City(
        name: "cana",
        latitude: 35.000074,
        longitude: 104.999927,
        number: 60605351),
    City(name: "Avogbana", latitude: 0.0, longitude: 0.0, number: 60605326),
    City(
        name: "Dan",
        latitude: 9.88810425,
        longitude: 10.198213113109587,
        number: 60605376),
    City(
        name: "Setto",
        latitude: 7.4975861,
        longitude: 2.0742249,
        number: 60605374),
    City(name: "Panwignan", latitude: 0.0, longitude: 0.0, number: 60605230),
    City(
        name: "Dassa",
        latitude: 12.4158999,
        longitude: -2.6972208123987853,
        number: 90011488),
    City(
        name: "Glazoue",
        latitude: 8.16811735,
        longitude: 2.2291357527306785,
        number: 94186050),
    City(
        name: "Thio",
        latitude: -21.6115836,
        longitude: 166.2155524,
        number: 68335141),
    City(name: "Offè", latitude: 8.45, longitude: 5.633333, number: 98028777),
    City(
        name: "Savè",
        latitude: 7.9852170000000005,
        longitude: 2.5417577150572566,
        number: 98025939),
    City(
        name: "Challa Ogoî",
        latitude: 8.4032305,
        longitude: 2.5904238,
        number: 95774547),
    City(
        name: "Sakin",
        latitude: 12.494112,
        longitude: 17.096744,
        number: 64823208),
    City(
        name: "Toui",
        latitude: 8.683143,
        longitude: 2.5918508,
        number: 68777216),
    City(
        name: "Tchatchou",
        latitude: 9.1267264,
        longitude: 2.55831,
        number: 95122284),
    City(
        name: "Tchaourou",
        latitude: 8.8881676,
        longitude: 2.596108,
        number: 65775504),
    City(
        name: "Kilibo",
        latitude: 8.5739444,
        longitude: 2.6006985,
        number: 95792074),
    City(name: "Pkoi", latitude: 0.0, longitude: 0.0, number: 94986192),
    City(
        name: "Guèma",
        latitude: 15.7669655,
        longitude: -4.2481176,
        number: 99911721),
    City(
        name: "Sirarou",
        latitude: 9.5891431,
        longitude: 2.6489264,
        number: 99555305),
    City(
        name: "N'dali",
        latitude: 9.68833355,
        longitude: 2.4633606935043417,
        number: 99555291),
    City(
        name: "Ouenou",
        latitude: 9.931989,
        longitude: 3.4147689736390534,
        number: 98634747),
    City(
        name: "Ina",
        latitude: 35.830452,
        longitude: 137.954916,
        number: 94369247),
    City(
        name: "Bkè",
        latitude: 1.4022486,
        longitude: 103.7733405,
        number: 60784173),
    City(name: "Gamian", latitude: 0.0, longitude: 0.0, number: 60654485),
    City(
        name: "Sori",
        latitude: 44.3733735,
        longitude: 9.1044467,
        number: 63353514),
    City(name: "Beroubouè", latitude: 0.0, longitude: 0.0, number: 63544820),
    City(
        name: "Gogounou",
        latitude: 10.8522725,
        longitude: 2.7290948000000004,
        number: 60929393),
    City(
        name: "Kandi 1",
        latitude: 11.1324554,
        longitude: 2.9116559,
        number: 65897781),
    City(name: "Angadadebou", latitude: 0.0, longitude: 0.0, number: 98682323),
    City(
        name: "Guéne",
        latitude: 9.886757,
        longitude: 15.4864096,
        number: 60156426),
    City(
        name: "Monkpa",
        latitude: 7.9229316,
        longitude: 2.0673469975952896,
        number: 95289291),
    City(
        name: "Savalou",
        latitude: 7.9297324,
        longitude: 1.9780951,
        number: 98189632),
    City(
        name: "Kpataba",
        latitude: 8.0553272,
        longitude: 1.9805982253623187,
        number: 65995895),
    City(
        name: "Gouka",
        latitude: 8.1342843,
        longitude: 1.9645649,
        number: 98995895),
    City(
        name: "Bantè",
        latitude: 8.33007795,
        longitude: 1.8696095473096985,
        number: 95789209),
    City(
        name: "Pira",
        latitude: 41.4236202,
        longitude: 1.2031023,
        number: 98264665),
    City(
        name: "Kprèkètè",
        latitude: 8.6704369,
        longitude: 1.6501592,
        number: 55002339),
    City(
        name: "Bassila",
        latitude: 8.96666435,
        longitude: 1.8218396684307867,
        number: 51978313),
    City(name: "Penesoulou", latitude: 0.0, longitude: 0.0, number: 66460644),
    City(
        name: "Pelebina",
        latitude: 9.4722323,
        longitude: 1.6382814,
        number: 69702108),
    City(
        name: "Bougou",
        latitude: 13.477507,
        longitude: -0.43542,
        number: 51046171),
    City(name: "Kolokondé", latitude: 0.0, longitude: 0.0, number: 55002343),
    City(
        name: "Copargo",
        latitude: 9.8817865,
        longitude: 1.5446319011603729,
        number: 51978327),
    City(
        name: "Perma",
        latitude: 10.1144986,
        longitude: 1.4429194,
        number: 64251130),
    City(
        name: "Tchoumitchoumi",
        latitude: 0.0,
        longitude: 0.0,
        number: 65783047),
    City(
        name: "Djougou 2",
        latitude: 9.7106683,
        longitude: 1.6651614,
        number: 55002341),
    City(
        name: "Sérou",
        latitude: 9.74033375,
        longitude: 3.1781014177063636,
        number: 51978343),
    City(
        name: "Partago",
        latitude: 9.3260691,
        longitude: 1.4740945,
        number: 69634290),
    City(
        name: "Onklou",
        latitude: 9.4996284,
        longitude: 1.9847102,
        number: 90304499),
    City(
        name: "Bétérou",
        latitude: 9.2021611,
        longitude: 2.2736894,
        number: 65440426),
    City(
        name: "Sanson",
        latitude: 9.277565,
        longitude: 2.4291363,
        number: 95319735),
    City(
        name: "Dassari",
        latitude: 13.131634,
        longitude: -0.053252,
        number: 94139976),
    City(
        name: "Porga",
        latitude: 48.1441501,
        longitude: 19.1206244,
        number: 65782088),
    City(
        name: "Fifadji",
        latitude: 6.3928634,
        longitude: 2.4006742,
        number: 63939950),
    City(
        name: "Hlassamè",
        latitude: 6.9022918,
        longitude: 1.940958,
        number: 68222021),
    City(
        name: "Natitingou",
        latitude: 10.251408300000001,
        longitude: 1.383540986380074,
        number: 98694747),
    City(
        name: "Kpédékpo",
        latitude: 7.2325499,
        longitude: 2.5006873,
        number: 60602830),
    City(
        name: "Ouinhi",
        latitude: 7.08236145,
        longitude: 2.4835912066427603,
        number: 60605358),
    City(
        name: "Madecali",
        latitude: 11.7038421,
        longitude: 3.5482894,
        number: 63424821),
    City(
        name: "Dasso",
        latitude: 7.0109964,
        longitude: 2.4669881,
        number: 60605360),
    City(
        name: "Covè",
        latitude: 7.2999575,
        longitude: 2.298927334403489,
        number: 60605329),
    City(
        name: "Ikpinlè",
        latitude: 6.8934655,
        longitude: 2.6210505,
        number: 60904141),
    City(
        name: "Adja-ouèrè",
        latitude: 7.01182455,
        longitude: 2.5983039082882566,
        number: 94766329),
    City(
        name: "Kétou",
        latitude: 7.3604193,
        longitude: 2.6024222,
        number: 98894444),
    City(
        name: "kpankou",
        latitude: 7.3353885,
        longitude: 2.5899491,
        number: 98763737),
    City(
        name: "Massè",
        latitude: 8.0700808,
        longitude: 2.3436445,
        number: 98118834),
    City(
        name: "Pobè",
        latitude: 6.9820238,
        longitude: 2.666791,
        number: 98763939),
    City(
        name: "Sakété",
        latitude: 6.74403185,
        longitude: 2.676550749159847,
        number: 98765250),
    City(name: "Effèhoutè", latitude: 0.0, longitude: 0.0, number: 65046895)
  ];
}
