import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';

import 'package:cyney/src/pages/home/movies/components/movie_list_horizontal.dart';

import 'package:cyney/src/utils/styles.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  MoviesScreen({Key key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: white,
      //   title: Text('data'),
      //   elevation: 0,
      //   toolbarHeight: 0,
      // ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight(context) * 0.11),
            MovieListHorizontal(title: 'Popular', type: MovieCat.Popular),
            // MovieListHorizontal(
            //   title: 'Now in Cinema',
            //   type: MovieCat.NowPlaying,
            // ),
            // MovieListHorizontal(title: 'Coming Soon', type: MovieCat.Upcoming),
            //MovieListHorizontal(title: 'Top Rated', type: MovieCat.TopRated),
          ],
        ),
      ),
    );
  }
}

//  BlocBuilder<MoviesBloc, MoviesState>(

//             builder: (context, state) {
//               if (state is MoviesInitial) {
//                 return Loading();
//               }
//               if (state is MoviesLoading) {
//                 return Loading();
//               }
//               if (state is MoviesLoaded) {
//                 final movies = state.movieResult.results;
//                 //  print("========> " + state.movieResult.props.toString());

//                 if (movies.isEmpty) {
//                   return Center(
//                     child: Text('no movies'),
//                   );
//                 }
//                 return ListView.builder(
//                   itemBuilder: (BuildContext context, int index) {
//                     return MovieWidget(movie: movies[index], index: index + 1);
//                   },
//                   itemCount: movies.length,
//                 );
//               }
//               return err.Error(errorMessage: '');
//             },
//           ),

class MovieWidget extends StatelessWidget {
  final int index;
  final Movie movie;

  const MovieWidget({Key key, this.index, @required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '$index',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(movie.title ?? ''),
      isThreeLine: true,
      subtitle: Text(movie.releaseDate.substring(0, 4) ?? ''),
      dense: true,
    );
  }
}
