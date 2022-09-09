
import 'package:flutter/material.dart';
import 'package:footballer/presentation/lineups/bloc/bloc.dart';

import '../../injections.dart';

class LineupsUi extends StatefulWidget {
  static const String routeName = "/lineups";

  const LineupsUi({Key? key}) : super(key: key);

  @override
  State<LineupsUi> createState() => _LineupsUiState();
}

class _LineupsUiState extends State<LineupsUi> {

  late LineupsBloc lineupsBloc;

  @override
  void initState() {
    super.initState();
    lineupsBloc = getIt<LineupsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("lineups"),
    );
  }
}
