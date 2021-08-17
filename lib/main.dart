import 'package:cyney/service_locator.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:cyney/src/bloc/movies_bloc/movies_bloc.dart';
import 'package:cyney/src/pages/nav_screen.dart';
import 'package:cyney/src/utils/app_color.dart';
import 'package:cyney/src/utils/constant.dart';
import 'package:cyney/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //Call this first to make sure we can make other system level calls safely
  WidgetsFlutterBinding.ensureInitialized();

  // Init service locator
  await setupLocator();

  // Status bar style on Android/iOS
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());

  // Only portrait
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  // runApp(
  //   EasyLocalization(
  //     supportedLocales: [
  //       const Locale('en'),
  //       const Locale('fr'),
  //     ],
  //     path: 'assets/locales',
  //     fallbackLocale: const Locale('en'),
  //     useOnlyLangCode: true,
  //     child: MultiBlocProvider(
  //       providers: [
  //         BlocProvider(create: (_) => locator<MoviesBloc>(), lazy: false),
  //       ],
  //       child: CyneyApp(),
  //     ),
  //   ),
  // );

  // je suis un commentaire

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<MoviesBloc>()),
      ],
      child: CyneyApp(),
    ),
  );
}

class CyneyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColorMaterial,
        /**
         * giggggygyggy
         */
        //scaffoldBackgroundColor: bgColor,
        // appBarTheme: AppBarTheme(color: Colors.black),
        // brightness: Brightness.dark,
        // primaryColor: Colors.red,
        /**
         * mon commentaire
         */
        fontFamily: Fonts.rubik,
        iconTheme: IconThemeData(color: Colors.red),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(selectedItemColor: red),
      ),
      home: NavScreen(),
    );
  }
}