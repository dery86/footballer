
import 'package:flutter/material.dart';

class LineupsUi extends StatefulWidget {
  static const String routeName = "/lineups";

  const LineupsUi({Key? key}) : super(key: key);

  @override
  State<LineupsUi> createState() => _LineupsUiState();
}

class _LineupsUiState extends State<LineupsUi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("lineups"),
    );
  }
}
