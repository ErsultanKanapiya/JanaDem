import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/dio/dio_exceptions.dart';

class ApiGetUserInfo{
  var box = Hive.box('accountData');
  final DioClient _dioClient;

  ApiGetUserInfo(this._dioClient);

  // this is one of the main apis, cause it gives us an info about user

  Future<void> getUserInfo() async {
    final String url = '${Endpoints().mainEndpoint}/v1/user/request_user_info/';

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'JWT ${box.get('access')}'
    };

    try {
      final res = await _dioClient.get(url, options: Options(headers: headers));
      if (res.statusCode == 200) {

        if(res.data['user_type'] == 'User'){
          box.put('user', res.data);
        } else if (res.data['user_type'] == 'Akimat') {
          box.put('akim', res.data);
        } else {
          box.put('moderator', res.data);
        }


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