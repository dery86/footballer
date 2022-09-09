
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballer/pages_router.dart';

import 'common/config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Footballer',
      onGenerateRoute: (settings) => PagesRouter.getRoutes(settings),
      debugShowCheckedModeBanner: false,
      builder: (context, navigator){
        return Theme(
          data: ThemeData(
              primaryColor: AppColors.primary,
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
              colorScheme:  const ColorScheme.light().copyWith(secondary: AppColors.secondary) ,
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.light),
              fontFamily: 'Poppins'),
          child: navigator!,
        );
      },
    );
  }
}
