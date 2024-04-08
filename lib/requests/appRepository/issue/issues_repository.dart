import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:janadem/dio/dio_exceptions.dart';
import 'package:janadem/models/issue/issues_list/issues_list_model.dart';
import 'package:janadem/requests/appRequestsApi/issue/issues_request_api.dart';

class IssuesRepository{
  final IssuesRequestApi issuesRequestApi;

  IssuesRepository(this.issuesRequestApi);

  Future<IssuesListModel> fetchIssueList() async {
    try {
      final res = await issuesRequestApi.fetchIssuesList();
      return res;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}