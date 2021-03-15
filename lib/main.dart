import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:cyney/service_locator.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:cyney/src/bloc/movies_bloc/movies_bloc.dart';
import 'package:cyney/src/pages/main_screen.dart';
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

  runApp(
    MultiBlocProvider(
        providers: [BlocProvider(create: (_) => locator<MoviesBloc>())],
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColorMaterial,
        //scaffoldBackgroundColor: bgColor,
        // appBarTheme: AppBarTheme(color: Colors.black),
        // brightness: Brightness.dark,
        // primaryColor: Colors.red,
        fontFamily: Fonts.rubik,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(color: Colors.red),
      ),
      home: MainScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesBloc>(context)
        .add(GetMoviesEvent(type: MovieCat.Popular, currentPageIndex: 50));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 0,
        child: Center(),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MoviesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MoviesLoaded) {
            final movies = state.movieResult.results;
            //  print("========> " + state.movieResult.props.toString());

            if (movies.isEmpty) {
              return Center(
                child: Text('no movies'),
              );
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MovieWidget(movie: movies[index]);
              },
              itemCount: movies.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${movie.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(movie.title ?? ''),
      isThreeLine: true,
      subtitle: Text(movie.overview ?? ''),
      dense: true,
    );
  }
}
