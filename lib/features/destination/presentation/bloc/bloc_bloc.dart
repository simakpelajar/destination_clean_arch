import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:clean_arc_lesson/features/destination/presentation/bloc/index.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {

  BlocBloc(BlocState initialState) : super(initialState){
   on<BlocEvent>((event, emit) {
      return emit.forEach<BlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'BlocBloc', error: error, stackTrace: stackTrace);
          return ErrorBlocState(error.toString());
        },
      );
    });
  }
}
