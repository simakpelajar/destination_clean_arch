import 'dart:async';
import 'dart:developer' as developer;

import 'package:clean_arc_lesson/features/destination/presentation/bloc/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlocEvent {
  Stream<BlocState> applyAsync(
      {BlocState currentState, BlocBloc bloc});
}

class UnBlocEvent extends BlocEvent {
  @override
  Stream<BlocState> applyAsync({BlocState? currentState, BlocBloc? bloc}) async* {
    yield UnBlocState();
  }
}

class LoadBlocEvent extends BlocEvent {
   
  @override
  Stream<BlocState> applyAsync(
      {BlocState? currentState, BlocBloc? bloc}) async* {
    try {
      yield UnBlocState();
      await Future.delayed(const Duration(seconds: 1));
      yield InBlocState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorBlocState( _.toString());
    }
  }
}
