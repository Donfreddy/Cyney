import 'package:cyney/domain/usecases/get_movies_usecase.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetGetMovies extends Mock implements GetMoviesUsecase {}

void main() {
  MoviesBloc bloc;
  MockGetGetMovies mockGetGetMovies;

  setUp(() {
    mockGetGetMovies = MockGetGetMovies();

    bloc = MoviesBloc(movies: mockGetGetMovies);
  });

  test('initialState should be MoviesInitial', () {
    // assert
    expect(bloc.initialState, equals(MoviesInitial()));
  });
}
