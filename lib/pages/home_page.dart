// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    TextButton(
      onPressed: () {},
      child: const Text(
        'История заказы',
        style: optionStyle,
      ),
    ),
    const Text(
      'Настройка',
      style: optionStyle,
    ),
    const Text(
      'Вы действительно хочешь выйти? ',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showDialogMethod() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 29, 20, 70),
          child: Card(
            child: _widgetOptions[_selectedIndex],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Профил',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text('Имя: \nBakyt Suiunbekov'),
                  Text('Emil: \nbakytsuiunbekov@gmail.com')
                ],
              ),
            ),
            ListTile(
              title: const Text('Заказдар'),
              selected: _selectedIndex == 0,
              onTap: () {
                _showDialogMethod();
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: const Text('Настройка'),
              selected: _selectedIndex == 1,
              onTap: () {
                _showDialogMethod();
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: const Text('Выйти из аккаунт'),
              selected: _selectedIndex == 2,
              onTap: () {
                _showDialogMethod();
                _onItemTapped(2);
              },
            ),
            ListTile(
              title: const Text('Назад'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
