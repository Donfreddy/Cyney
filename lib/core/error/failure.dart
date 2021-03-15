import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.

  // Failure([List properties = const <dynamic>[]]) : super(properties);

  @override
  List<dynamic> get props => [];
}

// General failures
class ConnectionFailure extends Failure {}

class BadRequestFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnknownFailure extends Failure {}
