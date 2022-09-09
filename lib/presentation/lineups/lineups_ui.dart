import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballer/presentation/fixtures/finished_game_item.dart';
import 'package:footballer/presentation/lineups/bloc/bloc.dart';

import '../../common/config.dart';
import '../../injections.dart';
import 'court.dart';

class LineupsUi extends StatefulWidget {
  static const String routeName = "/lineups";

  const LineupsUi(
      this.fixtureId,
      this.homeScore,
      this.awayScore,
      this.hour,
      this.date,
      {Key? key}
      ) : super(key: key);
  final int? fixtureId;
  final int? homeScore;
  final int? awayScore;
  final String? hour;
  final String? date;
  @override
  State<LineupsUi> createState() => _LineupsUiState();
}

class _LineupsUiState extends State<LineupsUi> {
  late LineupsBloc lineupsBloc;

  @override
  void initState() {
    super.initState();
    lineupsBloc = getIt<LineupsBloc>();
    lineupsBloc.add(GetLineupsEvent(widget.fixtureId));
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
      body: BlocBuilder<LineupsBloc, LineupsState>(
        bloc: lineupsBloc,
        builder: (context, state){
          if(state is LineupsLoadedSuccessState){
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 24),
                      Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                            state.data.getHomeLogo()??"",
                            width: 48,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.26,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              state.data.getHomeName()??"",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.greyLine
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "${widget.homeScore??""} - ${widget.awayScore??""}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                      state.data.getAwayLogo()??"",
                            width: 48,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.26,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              state.data.getAwayName()??"",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "Away",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.greyLine
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 1,
                    margin: const EdgeInsetsDirectional.only(top: 16, bottom: 4),
                    color: AppColors.greyLine,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.hour??"",
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        " - "+(widget.date??""),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),

                  Court(state.data.getHomePlayers(),state.data.getAwayPlayers(),
                  state.data.getHomeLogo(), state.data.getAwayLogo())
                ],
              ),
            );
          } else if(state is LineupsLoadedFailureState){
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
        },
      ),
    );
  }
}

