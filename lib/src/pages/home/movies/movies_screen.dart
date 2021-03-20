import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:cyney/src/components/cover_line.dart';
import 'package:cyney/src/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyney/src/components/error.dart' as err;

class MoviesScreen extends StatefulWidget {
  MoviesScreen({Key key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesBloc>(context)
        .add(GetMoviesEvent(type: MovieCat.Popular, currentPageIndex: 50));
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesInitial) {
                return Loading();
              }
              if (state is MoviesLoading) {
                return Loading();
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
              return err.Error(errorMessage: '');
            },
          ),
          CoverLine(
            alignment: Alignment.bottomCenter,
          ),
        ],
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
