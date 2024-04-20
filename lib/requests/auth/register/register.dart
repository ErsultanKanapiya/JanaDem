import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/dio/dio_exceptions.dart';
import 'package:janadem/screens/user/auth/login/login_screen.dart';
import 'package:oktoast/oktoast.dart';

class ApiRegister{
  final DioClient _dioClient;

  ApiRegister(this._dioClient);

  // registering api request

  Future<void> register(String first_name, String lastname, String phone, String email, String dateOfBirth, String password) async {
    final String url = '${Endpoints().mainEndpoint}/v1/user/';

    final headers = {
      'Accept': 'application/json',
    };
    final fields = {
      'first_name': first_name,
      'last_name': lastname,
      'phone_number': phone.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '').replaceAll('-', ''),
      'email': email,
      'birth_date': dateOfBirth,
      'password': password,
      'user_type': 1,
    };

    try{
      final res = await _dioClient.post(url, data: fields, options: Options(headers: headers));
      if (res.statusCode == 200 || res.statusCode == 201) {
        showToast('Registered successfully',
            position: const ToastPosition(align: Alignment.bottomCenter));
        Get.offAll(
            () => const LoginScreen(status: 1)
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