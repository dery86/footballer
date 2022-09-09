import 'package:flutter/material.dart';
import 'package:footballer/common/config.dart';
import 'package:footballer/injections.dart';
import 'package:footballer/presentation/fixtures/bloc/bloc.dart';
import 'package:footballer/presentation/fixtures/finished_games_tab.dart';
import 'package:footballer/presentation/fixtures/upcoming_games_tab.dart';

class FixturesUi extends StatefulWidget {
  static const String routeName = "/";

  const FixturesUi({Key? key}) : super(key: key);

  @override
  State<FixturesUi> createState() => _FixturesUiState();
}

class _FixturesUiState extends State<FixturesUi> with SingleTickerProviderStateMixin{

  late FixturesBloc fixturesBloc;
  late TabController _allTabsController;


  @override
  void initState() {
    super.initState();
    fixturesBloc = getIt<FixturesBloc>();
    _allTabsController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Footballer"
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 48,
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            child: TabBar(
              tabs: const [
                Tab(
                  text: "Finished Games",
                ),
                Tab(
                  text: "Upcoming Games",
                )
              ],
              indicatorWeight: 3,
              labelColor: Colors.black,
              controller: _allTabsController,
              unselectedLabelColor: Colors.black26,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 128,
            child: TabBarView(
              controller: _allTabsController,
              children: const [
                FinishedGamesTab(),
                UpcomingGamesTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
