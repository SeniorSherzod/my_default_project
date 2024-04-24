import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Add your onTap functionality here
            },
          ),
          ListTile(
            title: const Text('Summary '),
            onTap: () {
              // Add your onTap functionality here
            },
          ),
          ListTile(
            title: const Text('Academic '),
            onTap: () {
              // Add your onTap functionality here
            },
          ),
          ListTile(
            title: const Text('Experience'),
            onTap: () {
              // Add your onTap functionality here
            },
          ),
          ListTile(
            title: const Text('Scills'),
            onTap: () {
              // Add your onTap functionality here
            },
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () {
              // Add your onTap functionality here
            },
          ), ListTile(
            title: const Text('Porfolio'),
            onTap: () {
              // Add your onTap functionality here
            },
          ),
          ListTile(
            title: const Text('Download CV'),
            onTap: () {
              // Add your onTap functionality here
            },

          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              // Add your onTap functionality here
            },

          ),
        ],
      ),
    );
  }
}
