import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footballer/presentation/fixtures/finished_game_item.dart';
import 'package:footballer/presentation/lineups/bloc/bloc.dart';

import '../../common/config.dart';
import '../../injections.dart';
import 'court.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined,
          color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FinishedGameItem(),
            const SizedBox(height: 16,),
            Court()
          ],
        ),
      ),
    );
  }
}

