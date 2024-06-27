import 'package:flutter/material.dart';
import 'package:secouriste/app/core/constants.dart';
import 'package:secouriste/app/data/city.dart';

enum MenuOption { call, edit, delete }

class EmergencyContactWidget extends StatelessWidget {
  const EmergencyContactWidget({super.key, required this.city});
  final City? city;

  @override
  Widget build(BuildContext context) {
    //list tile with city name and phone number, and a button to call
    return Column(
      children: [
        ListTile(
          title: Text(
            ' Corridor ${city!.name}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('contact: ${city!.number}'),
          trailing: IconButton(
            color: primaryColor,
            icon: const Icon(Icons.menu),
            onPressed: () async {
              //show menu (call, edit, delete)
              final selectedOption = await showMenu<MenuOption>(
                context: context,
                position: const RelativeRect.fromLTRB(100.0, 100.0, 100.0,
                    100.0), // Adjust the position as needed
                items: [
                  const PopupMenuItem<MenuOption>(
                    value: MenuOption.call,
                    child: Text('Call'),
                  ),
                  const PopupMenuItem<MenuOption>(
                    value: MenuOption.edit,
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem<MenuOption>(
                    value: MenuOption.delete,
                    child: Text('Delete'),
                  ),
                ],
              );

              // Handle the selected option
              if (selectedOption != null) {
                switch (selectedOption) {
                  case MenuOption.call:
                    // Implement calling functionality
                    break;
                  case MenuOption.edit:
                    // Navigate to edit screen or show edit dialog
                    break;
                  case MenuOption.delete:
                    // Show confirmation dialog and delete
                    break;
                }
              }
            },
          ),
        ),
        //line to separate
        const Divider(),
      ],
    );
  }
}
