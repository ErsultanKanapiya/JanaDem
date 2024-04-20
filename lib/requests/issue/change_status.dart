import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/requests/get_user_info/get_user_info.dart';
import 'package:oktoast/oktoast.dart';

class ApiChangeStatus{
  var box = Hive.box('accountData');
  final DioClient _dioClient;

  final dio = Dio(BaseOptions());
  late final ApiGetUserInfo apiGetUserInfo = ApiGetUserInfo(DioClient(dio));

  ApiChangeStatus(this._dioClient);

  Future<void> changeIssueStatus(int issue_id, String status_id, WidgetRef ref) async {
    final String url = '${Endpoints().mainEndpoint}/v1/issue/change_status/';

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'JWT ${box.get('access')}'
    };

    Map fields = {
      'issue_id': issue_id,
      'status_id': status_id,
    };

    try {
      final res = await _dioClient.post(url, data: fields, options: Options(headers: headers));
      if (res.statusCode == 200 || res.statusCode==201) {

        await apiGetUserInfo.getUserInfo();

        showToast('Edited successfully',
            position: const ToastPosition(align: Alignment.bottomCenter));

      } else {
        debugPrint(res.data['message'].toString());
        Get.dialog(
            AlertDialog(
              backgroundColor: Colors.white,
              elevation: 0,
              content: Container(
                color: Colors.white,
                child: Text(
                  'Something went wrong! Try it later!',
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
                'Something went wrong! Try it later!',
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