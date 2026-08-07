import 'dart:convert';

import 'package:clean_arc_lesson/core/error/exceptions.dart';
import 'package:clean_arc_lesson/features/destination/data/model/destination_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cacheAllDestionationKey = 'all_destination';

abstract class DestinationLocalDataSource {
  Future<List<DestinationModel>> getAllDestination();
  Future<bool> cacheDestination(List<DestinationModel> data);
}

class DestinationLocalDataSourceImpl implements DestinationLocalDataSource {
  final SharedPreferences pref;

  DestinationLocalDataSourceImpl(this.pref);

  @override
  Future<bool> cacheDestination(List<DestinationModel> list) async {
    String listMap = list.map((e)=> e.toJson()).toList().toString();
    return pref.setString(cacheAllDestionationKey, listMap);
  }

  @override
  Future<List<DestinationModel>> getAllDestination() async{
    String? allDestination = pref.getString(cacheAllDestionationKey);
    if (allDestination != null) {
      List listMap  = List<Map<String,dynamic>>.from(jsonDecode(allDestination));
      return listMap.map((e) => DestinationModel.fromJson(e)).toList();
    }
    throw CachedException();
  }

}