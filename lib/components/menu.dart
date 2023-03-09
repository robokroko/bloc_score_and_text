import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Spacer(),
          ListTile(
            title: Material(
              color: Colors.transparent,
              child: ListTile(
                title: const Text('Add new word screen'),
                onTap: () {
                  Navigator.pushNamed(context, '/saveWord');
                },
              ),
            ),
          ),
          ListTile(
            title: Material(
              color: Colors.transparent,
              child: ListTile(
                title: const Text('Word list screen'),
                onTap: () {
                  Navigator.pushNamed(context, '/wordsList');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
