import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secouriste/app/core/constants.dart';
import 'package:secouriste/app/core/instances.dart';
import 'package:secouriste/app/module/principal/contacts/widgets/contact_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //listview builder of contacts in principalController list cities

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.05,
          child: const SearchBar(
            trailing: <Widget>[
              Icon(Icons.search),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: principalController
                .citiesList.length, // Set the number of items in the list
            itemBuilder: (BuildContext context, int index) {
              // Accessing each city from the cities list
              var city = principalController.citiesList[index];
              // Returning a widget for each city. For example, a ListTile
              return ContactWidget(city: city);
            },
          ),
        ),
      ],
    );
  }
}
