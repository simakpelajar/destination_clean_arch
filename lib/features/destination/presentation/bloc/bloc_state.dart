import 'package:equatable/equatable.dart';

abstract class BlocState extends Equatable {
  BlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnBlocState extends BlocState {

  UnBlocState();

  @override
  String toString() => 'UnBlocState';
}

/// Initialized
class InBlocState extends BlocState {
  InBlocState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InBlocState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorBlocState extends BlocState {
  ErrorBlocState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorBlocState';

  @override
  List<Object> get props => [errorMessage];
}
