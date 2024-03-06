import 'package:flutter/material.dart';

class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}

class SliderAvatar extends StatelessWidget {
  final Function(String) onItemClick;

  const SliderAvatar({Key? key, required this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 30),
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: Image.network(
                          'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp')
                          .image,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nick',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...[
                    Menu(Icons.wb_sunny, 'Day-Night Mode'),
                    Menu(Icons.language, 'Language'),
                  ]
                      .map(
                        (menu) => _SliderMenuItem(
                      title: menu.title,
                      iconData: menu.iconData,
                      onTap: () {
                        onItemClick(menu.title);
                        Navigator.pop(context); // Close the bottom sheet after item click
                      },
                    ),
                  )
                      .toList(),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.settings),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  const _SliderMenuItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: onTap,
    );
  }
}
