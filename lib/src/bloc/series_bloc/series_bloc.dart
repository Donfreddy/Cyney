import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc() : super(SeriesInitial());

  @override
  Stream<SeriesState> mapEventToState(
    SeriesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
