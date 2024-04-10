import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/dio/dio_exceptions.dart';
import 'package:janadem/requests/get_user_info/get_user_info.dart';
import 'package:janadem/screens/bottom_nav_bar.dart';
import 'package:oktoast/oktoast.dart';

class ApiEditProfile{
  var box = Hive.box('accountData');
  final DioClient _dioClient;

  final dio = Dio(BaseOptions());
  late final ApiGetUserInfo apiGetUserInfo = ApiGetUserInfo(DioClient(dio));

  ApiEditProfile(this._dioClient);

  Future<void> editProfileInfo(Map data) async {
    final String url = '${Endpoints().mainEndpoint}/v1/user/${box.get('user')['id']}/';

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'JWT ${box.get('access')}'
    };

    try {
      final res = await _dioClient.patch(url, data: data, options: Options(headers: headers));
      if (res.statusCode == 200 || res.statusCode==201) {

        await apiGetUserInfo.getUserInfo();

        showToast('Edited successfully',
            position: const ToastPosition(align: Alignment.bottomCenter));

        Get.offAll(
                () => const UserBottomNavBar()
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
      if (e.response != null) {

        Map<String, dynamic> errorData = e.response!.data;
        String errorMessage = '';

        errorData.forEach((key, value) {
          errorMessage += '${value[0].toString()}\n';
        });


        if (errorData.isNotEmpty) {

          Get.dialog(
              AlertDialog(
                backgroundColor: Colors.white,
                elevation: 0,
                content: Container(
                  color: Colors.white,
                  child: Text(
                    errorMessage,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF2F3556),
                      fontSize: 16,
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: (){
                        Get.back();
                      },
                      child:  Text(
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
      } else {
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
                    onPressed: (){
                      Get.back();
                    },
                    child:  Text(
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
}