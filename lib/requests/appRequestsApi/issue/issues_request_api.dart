import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/dio/dio_exceptions.dart';
import 'package:janadem/models/issue/issues_list/issues_list_model.dart';
import 'package:janadem/requests/appProviders/issue/issues_state_provider.dart';
import 'package:janadem/screens/user/add_problem/add_problem_screen.dart';
import 'package:janadem/screens/user/add_problem/map_screen.dart';
import 'package:latlong2/latlong.dart';

class IssuesRequestApi{
  var box = Hive.box('accountData');
  final DioClient _dioClient;

  IssuesRequestApi(this._dioClient);

  Future<IssuesListModel> fetchIssuesList() async {
    final String url = '${Endpoints().mainEndpoint}/v1/issue/';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'JWT ${box.get('access')}'
    };
    try {
      final res = await _dioClient.get(url, options: Options(headers: headers));
      final issuesList = IssuesListModel.fromJson({'issuesList': res.data});
      return issuesList;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postIssue(String imagePath, String title, String description, String longitude, String latitude, WidgetRef ref) async {
    final String url = '${Endpoints().mainEndpoint}/v1/issue/';

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'JWT ${box.get('access')}'
    };
    final fields = FormData.fromMap({
      'image': await MultipartFile.fromFile(imagePath),
      'title': title,
      'description': description,
      'longitude': longitude,
      'latitude': latitude
    });

    try {
      final res = await _dioClient.post(url, data: fields, options: Options(headers: headers));
      if (res.statusCode == 200 || res.statusCode==201) {
        ref.watch(locationProvider.notifier).state = const LatLng(43.2380, 76.8829);
        ref.watch(photoPathProvider.notifier).state = '';
        ref.invalidate(issuesDataProvider);
        Get.dialog(
            AlertDialog(
              backgroundColor: Colors.white,
              elevation: 0,
              content: Container(
                color: Colors.white,
                child: Text(
                  'Ваш запрос принят! Просим ожидать!',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF2F3556),
                    fontSize: 16,
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Закрыть',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2F3556),
                        fontSize: 16,
                      ),
                    )
                )
              ],
            )
        );
      } else {
        debugPrint(res.data['message'].toString());
        Get.dialog(
            AlertDialog(
              backgroundColor: Colors.white,
              elevation: 0,
              content: Container(
                color: Colors.white,
                child: Text(
                  res.data['message'].toString(),
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF2F3556),
                    fontSize: 16,
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Закрыть',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2F3556),
                        fontSize: 16,
                      ),
                    )
                )
              ],
            )
        );
        debugPrint('Что-то пошло не так!');
      }
    } on DioException catch (e) {
      Get.dialog(
          AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0,
            content: Container(
              color: Colors.white,
              child: Text(
                DioExceptions.fromDioError(e).toString(),
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF2F3556),
                  fontSize: 16,
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Закрыть',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2F3556),
                      fontSize: 16,
                    ),
                  )
              )
            ],
          )
      );
    }
  }
}