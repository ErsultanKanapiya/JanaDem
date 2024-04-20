import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/dio/dio_exceptions.dart';
import 'package:janadem/requests/get_user_info/get_user_info.dart';
import 'package:janadem/screens/akim/akim_bottom_nav_bar.dart';
import 'package:janadem/screens/bottom_nav_bar.dart';

class ApiLogin{
  var box = Hive.box('accountData');
  final DioClient _dioClient;

  ApiLogin(this._dioClient);

  // api request for login, that contains phone number and password

  Future<void> login(String phone, String password, int status) async {
    final String url = '${Endpoints().mainEndpoint}/v1/user/login';

    final dio = Dio(BaseOptions());
    late final ApiGetUserInfo apiGetUserInfo = ApiGetUserInfo(DioClient(dio));

    final headers = {
      'Accept': 'application/json',
    };
    final fields = {
      'phone_number': phone.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '').replaceAll('-', ''),
      'password': password,
    };

    try {
      final res = await _dioClient.post(url, data: fields, options: Options(headers: headers));
      if (res.statusCode == 200) {

        box.put('refresh', res.data['refresh']);
        box.put('access', res.data['access']);

        await apiGetUserInfo.getUserInfo();

        if(status == 1){
          Get.offAll(
                  () => const UserBottomNavBar()
          );
        } else {
          Get.offAll(
                  () => const AkimBottomNavBar()
          );
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
      if (e.response != null) {

        Map<String, dynamic> errorData = e.response!.data;
        String errorMessage = '';

        errorData.forEach((key, value) {
          errorMessage += '${value.toString()}\n';
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