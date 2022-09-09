import 'package:flutter/material.dart';

class FixturesUi extends StatefulWidget {
  static const String routeName = "/";

  const FixturesUi({Key? key}) : super(key: key);

  @override
  State<FixturesUi> createState() => _FixturesUiState();
}

class _FixturesUiState extends State<FixturesUi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("fixtures"),
    );
  }
}
