import 'dart:convert';

import 'package:clean_arc_lesson/api/urls.dart';
import 'package:clean_arc_lesson/core/error/exceptions.dart';
import 'package:clean_arc_lesson/features/destination/data/model/destination_model.dart'
    show DestinationModel, fromJson;
import 'package:http/http.dart' as http;

abstract class DestinationRemoteDataSource {
  Future<List<DestinationModel>> all();
  Future<List<DestinationModel>> top();
  Future<List<DestinationModel>> search(String query);
}

class DestinationRemoteDataSourceImpl implements DestinationRemoteDataSource {
  final http.Client client;

  DestinationRemoteDataSourceImpl({required this.client});
  @override
  Future<List<DestinationModel>> all() async {
    Uri url = Uri.parse('${URls.base}/destination/destination.php');
    final response = await client.get(url).timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
       List list = jsonDecode(response.body);
       return list.map((e)=>DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> search(String query) async {
    Uri url = Uri.parse('${URls.base}/destination/search.php');
    final response = await client
        .post(url, body: {'query': query})
        .timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> top() async {
    Uri url = Uri.parse('${URls.base}/destination/top.php');
    final response = await client.get(url).timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}
