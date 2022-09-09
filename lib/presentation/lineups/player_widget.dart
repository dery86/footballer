import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget(
      this.name, this.color, this.number,
      {Key? key}) : super(key: key);
  final String? number;
  final Color color;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.1,
          alignment: AlignmentDirectional.center,
          margin: EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Text(
            number??"",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ),
        ),
        Text(
          name??"",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 12
          ),
        )
      ],
    );
  }
}
