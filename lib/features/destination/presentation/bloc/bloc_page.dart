import 'package:flutter/material.dart';
import 'package:clean_arc_lesson/features/destination/presentation/bloc/index.dart';

class BlocPage extends StatefulWidget {
  static const String routeName = '/bloc';

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  final _blocBloc = BlocBloc(UnBlocState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: BlocScreen(blocBloc: _blocBloc),
    );
  }
}
