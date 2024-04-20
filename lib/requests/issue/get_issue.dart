import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/constants/hive_boxes.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/models/issue/issue_model.dart';

class ApiGetIssue{
  final DioClient _dioClient;

  ApiGetIssue(this._dioClient);

  // this api is used to get info about single issue

  Future<IssueModel?> getIssue(int id) async {
    final String url = '${Endpoints().mainEndpoint}/v1/issue/$id';

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'JWT ${acc.get('access')}'
    };

    Map data = {};
    IssueModel? issueModel;

    try{
      final res = await _dioClient.get(url, options: Options(headers: headers));
      if (res.statusCode == 200) {
        issueModel = IssueModel.fromJson(res.data);
      } else {
        debugPrint(res.data['message'].toString());
        debugPrint('Что-то пошло не так!');
      }


    } on DioException catch (e) {
      debugPrint(e.message);
    }

    return issueModel;
  }
}