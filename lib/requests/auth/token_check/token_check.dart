// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:janadem/dio/dio_client.dart';
//
// class ApiCheckToken{
//   var box = Hive.box('user_box');
//   final DioClient _dioClient;
//
//   ApiCheckToken(this._dioClient);
//
//   Future<void> checkToken() async {
//     final String url = '${Endpoints().mainEndpoint}/auth/check';
//     final headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ${box.get('token')}',
//     };
//
//     if(box.isNotEmpty){
//       try{
//         final res = await _dioClient.post(url, options: Options(headers: headers));
//         if (res.statusCode == 200) {
//           debugPrint(box.get('token'));
//           if(box.get('authType') == '' || box.get('authType') == null){
//             // Get.offAll(
//             //       () => const NewBottomNavBar(),
//             //   transition: Transition.rightToLeft,
//             // );
//             Get.offAll(
//                   () => const NewBottomNavBar(),
//               transition: Transition.rightToLeft,
//             );
//           } else if(box.get('authType')=='pin'){
//             Get.offAll(
//                   () => const NewPinCodeCheckScreen(),
//               transition: Transition.rightToLeft,
//             );
//           } else {
//             bool authenticate = await LocalAuth.authenticate();
//             authenticate == true
//                 ?
//             // Get.offAll(
//             //       () => const NewBottomNavBar(),
//             //   transition: Transition.rightToLeft,
//             // )
//             Get.offAll(
//                   () => const NewBottomNavBar(),
//               transition: Transition.rightToLeft,
//             )
//                 :
//             Get.offAll(
//                   () => const SplashScreen(),
//             );
//           }
//         } else if(res.statusCode == 401){
//           box.clear();
//           Get.offAll(
//                 () => const SplashScreen(),
//             transition: Transition.rightToLeft,
//           );
//         } else {
//           box.clear();
//           // Get.offAll(
//           //       () => const LoginScreen(),
//           //   transition: Transition.rightToLeft,
//           // );
//           Get.offAll(
//                 () => const NewLoginScreen(),
//             transition: Transition.rightToLeft,
//           );
//         }
//       } on DioException catch (e){
//         box.clear();
//         // Get.offAll(
//         //       () => const LoginScreen(),
//         //   transition: Transition.rightToLeft,
//         // );
//         Get.offAll(
//               () => const NewLoginScreen(),
//           transition: Transition.rightToLeft,
//         );
//       }
//     }else{
//       // Get.offAll(
//       //       () => const LoginScreen(),
//       //   transition: Transition.rightToLeft,
//       // );
//       Get.offAll(
//             () => const NewLoginScreen(),
//         transition: Transition.rightToLeft,
//       );
//     }
//   }
// }