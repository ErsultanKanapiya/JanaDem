import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';

class ApiGetIssue{
  final DioClient _dioClient;

  ApiGetIssue(this._dioClient);

  Future<Map> getIssue(int id) async {
    final String url = '${Endpoints().mainEndpoint}/v1/issue/$id';

    final headers = {
      'Accept': 'application/json',
    };

    Map data = {};

    try{
      final res = await _dioClient.get(url, options: Options(headers: headers));
      if (res.statusCode == 200) {
        data = res.data;
      } else {
        debugPrint(res.data['message'].toString());
        debugPrint('Что-то пошло не так!');
      }


    } on DioException catch (e) {
      debugPrint(e.message);
    }

    return data;
  }
}