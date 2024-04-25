import 'package:flutter/material.dart';

import '../widgets/day_view_widget.dart';

class DayViewPageDemo extends StatefulWidget {
  const DayViewPageDemo({super.key});

  @override
  _DayViewPageDemoState createState() => _DayViewPageDemoState();
}

class _DayViewPageDemoState extends State<DayViewPageDemo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DayViewWidget(),
    );
  }
}
