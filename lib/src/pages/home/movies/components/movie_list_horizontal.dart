import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:cyney/src/components/loading.dart';
import 'package:cyney/src/components/row_section.dart';
import 'package:cyney/src/pages/home/movies/components/movie_item_horizontal.dart';
import 'package:cyney/src/pages/home/movies/movie_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyney/src/components/error.dart';

class MovieListHorizontal extends StatefulWidget {
  final String title;
  final MovieCat type;

  MovieListHorizontal({Key key, @required this.title, @required this.type})
      : assert(title != null),
        assert(type != null),
        super(key: key);

  @override
  _MovieListHorizontalState createState() => _MovieListHorizontalState();
}

class _MovieListHorizontalState extends State<MovieListHorizontal> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowSection(
            title: widget.title,
            ontap: () {
              Navigator.push(
                context,
                CupertinoPageRoute<Widget>(
                  builder: (_) => MovieListScreen(
                    title: '${widget.title} Movies',
                    type: widget.type,
                  ),
                ),
              );
            }),
        SizedBox(
          height: 160,
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesInitial) {
                return Loading();
              } else if (state is MoviesLoading) {
                return Loading();
              } else if (state is MoviesLoaded) {
                final movies = state.movieResult.results;
                final curretPage = state.movieResult.page;
                final totalsPage = state.movieResult.totalPages;

                if (movies.isEmpty) {
                  return Center(
                    child: Text('no movies'),
                  );
                }
                if (curretPage < totalsPage) {}

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: movies.length,
                  controller: _scrollController,
                  // addAutomaticKeepAlives: true,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieItemHorizontal(movie: movies[index]);
                  },
                );
              } else if (state is MoviesFailure) {
                return Error(
                  errorMessage: state.message,
                  onRetryPressed: () => getMovies(),
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {}
  }

  void getMovies() {
    BlocProvider.of<MoviesBloc>(context).add(
      GetMoviesEvent(type: widget.type, currentPageIndex: 1),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
