// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ApiLogout{
//   var box = Hive.box('user_box');
//   final DioClient _dioClient;
//
//   ApiLogout(this._dioClient);
//
//   Future<void> logout() async {
//     final String url = '${Endpoints().mainEndpoint}/logout';
//
//     final headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ${box.get('token')}',
//     };
//
//     UserModelHive user = user_info_box.get('user');
//     String status = '${user.id}OneSignal';
//     final fields = {
//       'ip_device': status
//     };
//
//     try{
//       final res = await _dioClient.post(url, data: fields, options: Options(headers: headers));
//       if (res.statusCode == 200) {
//
//       } else {
//         debugPrint(res.data['message'].toString());
//         Get.dialog(
//             AlertDialog(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               content: Container(
//                 color: Colors.white,
//                 child: Text(
//                   res.data['message'].toString(),
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.normal,
//                     color: const Color(0xFF2F3556),
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: (){
//                       Get.back();
//                     },
//                     child:  Text(
//                       'Закрыть',
//                       style: GoogleFonts.roboto(
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF2F3556),
//                         fontSize: 16,
//                       ),
//                     )
//                 )
//               ],
//             )
//         );
//         debugPrint('Что-то пошло не так!');
//       }
//     } on DioException catch (e) {
//       Get.dialog(
//           AlertDialog(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             content: Container(
//               color: Colors.white,
//               child: Text(
//                 DioExceptions.fromDioError(e).toString(),
//                 style: GoogleFonts.roboto(
//                   fontWeight: FontWeight.normal,
//                   color: const Color(0xFF2F3556),
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: (){
//                     Get.back();
//                   },
//                   child:  Text(
//                     'Закрыть',
//                     style: GoogleFonts.roboto(
//                       fontWeight: FontWeight.bold,
//                       color: const Color(0xFF2F3556),
//                       fontSize: 16,
//                     ),
//                   )
//               )
//             ],
//           )
//       );
//     }
//   }
// }