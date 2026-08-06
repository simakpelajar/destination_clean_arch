import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arc_lesson/features/destination/presentation/bloc/index.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({
    required BlocBloc blocBloc,
    Key? key,
  })  : _blocBloc = blocBloc,
        super(key: key);

  final BlocBloc _blocBloc;

  @override
  BlocScreenState createState() {
    return BlocScreenState();
  }
}

class BlocScreenState extends State<BlocScreen> {
  BlocScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBloc, BlocState>(
        bloc: widget._blocBloc,
        builder: (
          BuildContext context,
          BlocState currentState,
        ) {
          if (currentState is UnBlocState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorBlocState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
           if (currentState is InBlocState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    widget._blocBloc.add(LoadBlocEvent());
  }
}
