import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:secouriste/app/core/constants.dart';
import 'package:secouriste/app/core/instances.dart';
import 'package:secouriste/app/module/principal/contacts/contacts_page.dart';
import 'package:secouriste/app/module/principal/emergency_contacts/emergency_contacts_page.dart';
import 'package:secouriste/app/module/principal/home/home.dart';

import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// ignore: must_be_immutable
class Principal extends StatelessWidget {
  final PageController _pageController = PageController();

  Principal({super.key});
  void onButtonPressed(int index) {
    principalController.currentPage.value = index;
    _pageController.animateToPage(principalController.currentPage.value,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Obx(() => Text(
                principalController.currentPage.value == 0
                    ? 'Acceuil'
                    : principalController.currentPage.value == 1
                        ? 'Contacts Coridors'
                        : 'Mes contacts d\'urgence',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
          ),
          //add background image
          //drawer: const CustomDrawer(),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: const Color(0xFFFBF9F9),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        principalController.currentPage.value = index;
                        index;
                      },
                      children: [
                        const Home(),
                        const ContactsPage(),
                        EmergencyContactsPage()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Obx(
            () => StylishBottomBar(
              onTap: onButtonPressed,
              currentIndex: principalController.currentPage.value,
              backgroundColor: primaryColor,
              option: AnimatedBarOptions(),
              items: [
                BottomBarItem(
                  icon: const Icon(Icons.home_outlined, size: 24),
                  selectedIcon: const Icon(Icons.home, size: 35),
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.white,
                  title: principalController.currentPage.value == 0
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 5, // Adjust the size of the dot as needed
                        )
                      : const SizedBox(),
                ),
                BottomBarItem(
                  icon: const Icon(
                    Icons.map_outlined,
                    size: 24,
                  ),
                  selectedIcon: const Icon(Icons.map, size: 35),
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.white,
                  title: principalController.currentPage.value == 1
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 5, // Adjust the size of the dot as needed
                        )
                      : const SizedBox(),
                ),
                BottomBarItem(
                  icon: const Icon(
                    Icons.emergency_outlined,
                    size: 24,
                  ),
                  selectedIcon: const Icon(Icons.emergency, size: 35),
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.white,
                  title: principalController.currentPage.value == 2
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 5, // Adjust the size of the dot as needed
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          )),
    );
  }
}
