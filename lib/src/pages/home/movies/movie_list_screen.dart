import 'dart:io';

import 'package:cyney/core/http/http_client.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_remote_data_source.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:cyney/src/components/loading.dart';
import 'package:cyney/src/pages/home/movies/components/movie_item_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyney/src/components/error.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieListScreen extends StatefulWidget {
  final String title;
  final MovieCat type;

  MovieListScreen({Key key, @required this.title, @required this.type})
      : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  bool isGrid = false;


  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: isGrid ? Icon(Icons.grid_on) : Icon(Icons.list),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          )
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesInitial) {
            return Loading();
          }
          if (state is MoviesLoading) {
            return Loading();
          }
          if (state is MoviesLoaded) {
            final movies = state.movieResult.results;
            final curretPage = state.movieResult.page;
            final totalsPage = state.movieResult.totalPages;

            if (movies.isEmpty) {
              return Center(
                child: Text('no movies'),
              );
            }

            if (curretPage < totalsPage) {}

            return MovieListLayout(
              movieResult: state.movieResult,
              type: widget.type,
              isGrid: isGrid,
            );
          }
          if (state is MoviesFailure) {
             return Error(
            errorMessage: state.message,
            onRetryPressed: () => getMovies(),
          );
          }
          return Error(
            errorMessage: 'An error occured!',
            onRetryPressed: () => getMovies(),
          );
        },
      ),
    );
  }

  void getMovies() {
    BlocProvider.of<MoviesBloc>(context).add(
      GetMoviesEvent(type: widget.type, currentPageIndex: 1),
    );
  }
}

class MovieListLayout extends StatefulWidget {
  final MovieResult movieResult;
  final MovieCat type;
  final bool isGrid;

  MovieListLayout({Key key, this.movieResult, this.type, this.isGrid})
      : super(key: key);

  @override
  _MovieListLayoutState createState() => _MovieListLayoutState();
}

class _MovieListLayoutState extends State<MovieListLayout> {
  int currentPage;
  int totalsPage;
  bool isLoading = false;
  List<Movie> movies;

  final client = HttpClient();
  MoviesRemoteDataSourceImpl dataSource;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    dataSource = MoviesRemoteDataSourceImpl(client: client);
    currentPage = widget.movieResult.page;
    totalsPage = widget.movieResult.totalPages;
    movies = widget.movieResult.results;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onNotificatin,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: movies.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index == movies.length - 1) {
            movies.removeLast();
            return SizedBox(
              child: Center(
                  child: SpinKitFadingCircle(
                color: Colors.grey[400],
                size: 40,
              )),
            );
          }
          return MovieItemVertical(movie: movies[index]);
        },
      ),
    );
  }

  void loadMoreMovies() async {
    final moreMovies = await MoviesRemoteDataSourceImpl(client: client)
        .getMovies(widget.type, currentPage + 1);

    if (moreMovies != null) {
      currentPage = moreMovies.page;
      totalsPage = moreMovies.totalPages;
      moreMovies.results.add(null);

      if (mounted)
        setState(() {
          isLoading = false;
          movies.addAll(moreMovies.results);
        });
    }
  }

  bool onNotificatin(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (!isLoading) {
          if (currentPage < totalsPage) loadMoreMovies();
          isLoading = true;
        }
      }
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // NotificationListener(
  //           onNotification: onNotificatin,
  //           child: GridView.builder(
  //             controller: _scrollController,
  //             itemCount: movies.length,
  //             physics: BouncingScrollPhysics(),
  //             itemBuilder: (BuildContext context, int index) {
  //               if (index == movies.length - 1) {
  //                 movies.removeLast();
  //                 return SizedBox(
  //                   child: Center(
  //                       child: SpinKitFadingCircle(
  //                     color: Colors.grey[400],
  //                     size: 40,
  //                   )),
  //                 );
  //               }
  //               return MovieItemHorizontal(movie: movies[index]);
  //             },
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 childAspectRatio: 0.68, crossAxisCount: 3),
  //           ),
  //         );
}
