import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class _FixturesUiState extends State<FixturesUi>
    with SingleTickerProviderStateMixin {
  late FixturesBloc fixturesBloc;
  late TabController _allTabsController;

  @override
  void initState() {
    super.initState();
    fixturesBloc = getIt<FixturesBloc>();
    fixturesBloc.add(GetFixturesEvent(2023, 850));
    _allTabsController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Footballer"),
        centerTitle: true,
      ),
      body: BlocBuilder<FixturesBloc, FixturesState>(
          bloc: fixturesBloc,
          builder: (context, state) {
            if (state is FixturesLoadedSuccessState) {
              return Column(
                children: [
                  Container(
                    height: 48,
                    margin:
                        const EdgeInsetsDirectional.only(start: 16, end: 16),
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
                      children: [
                        FinishedGamesTab(state.finishedGames),
                        UpcomingGamesTab(state.upcomingGames),
                      ],
                    ),
                  )
                ],
              );
            } else if (state is FixturesLoadedFailureState) {
              return Container(
                alignment: AlignmentDirectional.center,
                child: Text(state.message),
              );
            }

            return Container(
              alignment: AlignmentDirectional.center,
              child: const SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            );
          }),
    );
  }
}
