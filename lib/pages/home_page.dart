import 'package:flutter/material.dart';
import 'package:sakura_test/extension.dart';
import 'package:sakura_test/pages/create_event_page.dart';
import 'package:sakura_test/pages/day_view_page.dart';
import 'package:sakura_test/pages/month_view_page.dart';
import 'package:sakura_test/pages/week_view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MonthViewPageDemo(),
    DayViewPageDemo(),
    WeekViewDemo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sakura Calendar',
                        style: TextStyle(fontSize: 23),
                      ),
                      Text(
                        'Menampilkan tanggal dalam ${_selectedIndex == 0 ? 'bulan' : _selectedIndex == 1 ? 'hari' : 'minggu'}',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () =>
                          context.pushRoute(const CreateEventPage()),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ))
                ],
              ),
            ),
            Expanded(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Bulan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_day),
              label: 'Hari',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_week),
              label: 'Minggu',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
