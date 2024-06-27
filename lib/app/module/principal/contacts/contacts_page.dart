import 'package:flutter/material.dart';
import 'package:secouriste/app/core/instances.dart';
import 'package:secouriste/app/data/city.dart';
import 'package:secouriste/app/module/principal/contacts/widgets/contact_widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<City> _filteredCities = [];

  @override
  void initState() {
    super.initState();
    // Initially, all cities are shown
    _filteredCities = principalController.citiesList;
    // Listen to changes in the search bar
    _searchController.addListener(_filterCities);
  }

  void _filterCities() {
    final query = _searchController.text.toLowerCase();
    final filteredCities = principalController.citiesList.where((city) {
      // Assuming City has a 'name' field to search by. Adjust if necessary.
      return city.name.toLowerCase().contains(query);
    }).toList();

    setState(() {
      _filteredCities = filteredCities;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.05,
          child: SearchBar(
            controller: _searchController, // Use the controller here
            hintText: 'Rechercher un contact',
            trailing: const <Widget>[
              Icon(Icons.search),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredCities.length, // Use the filtered list
            itemBuilder: (BuildContext context, int index) {
              var city = _filteredCities[index];
              return ContactWidget(city: city);
            },
          ),
        ),
      ],
    );
  }
}
