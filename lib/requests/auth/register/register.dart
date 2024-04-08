import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/api.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/dio/dio_exceptions.dart';
import 'package:janadem/screens/user/auth/login/login_screen.dart';

class ApiRegister{
  final DioClient _dioClient;

  ApiRegister(this._dioClient);

  Future<void> register(String first_name, String lastname, String phone, String email, String dateOfBirth, String password) async {
    final String url = '${Endpoints().mainEndpoint}/v1/user/';

    final headers = {
      'Accept': 'application/json',
    };
    final fields = {
      'first_name': first_name,
      'last_name': lastname,
      'phone_number': phone,
      'email': email,
      'birth_date': dateOfBirth,
      'password': password
    };

    try{
      final res = await _dioClient.post(url, data: fields, options: Options(headers: headers));
      if (res.statusCode == 200 || res.statusCode == 201) {
        print(res.data);
        Get.offAll(
            () => const LoginScreen()
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