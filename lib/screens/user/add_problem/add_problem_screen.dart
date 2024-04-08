import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/requests/appRequestsApi/issue/issues_request_api.dart';
import 'package:janadem/screens/user/add_problem/camera_page.dart';
import 'package:janadem/screens/user/add_problem/map_screen.dart';
import 'package:janadem/screens/widgets/textform_widget.dart';
import 'package:latlong2/latlong.dart';

final photoPathProvider = StateProvider.autoDispose<String>((ref) => '');

class AddProblemScreen extends ConsumerStatefulWidget {
  const AddProblemScreen({super.key});

  @override
  ConsumerState createState() => _AddProblemScreenState();
}

class _AddProblemScreenState extends ConsumerState<AddProblemScreen> {

  final dio = Dio(BaseOptions());
  late final IssuesRequestApi apiIssue = IssuesRequestApi(DioClient(dio));

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool sendIssueRequest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xff5FAFAF),
          surfaceTintColor: const Color(0xff5FAFAF),
          title: Text(
            'Problem Location',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black
            ),
          ),
        ),
        body: SafeArea(
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerDown: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  ref.watch(photoPathProvider) == ''
                      ? GestureDetector(
                    onTap: (){
                      Get.to(
                              () => const CameraPage()
                      );
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade400
                      ),
                    ),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                      child: Center(
                        child: Stack(
                          children: [
                            Center(
                              child: Image.file(
                                File(ref.watch(photoPathProvider)),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      ref.watch(photoPathProvider.notifier).state = '';
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(235, 67, 53, 0.54).withOpacity(0.3)
                                      ),
                                      margin: const EdgeInsets.symmetric(horizontal: 3),
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset('${Assets().icn}trash.svg'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(
                                              () => const CameraPage()
                                      );
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color.fromRGBO(44, 44, 44, 0.46).withOpacity(0.3)
                                      ),
                                      margin: const EdgeInsets.symmetric(horizontal: 3),
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset('${Assets().icn}edit.svg'),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      cursorColor: const Color(0xff1A1B22),
                      cursorWidth: 1,
                      cursorHeight: 20,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.text,
                      controller: titleController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        border: textFieldBorder(const Color(0xff797979)),
                        focusedBorder: textFieldBorder(const Color(0xff797979)),
                        disabledBorder: textFieldBorder(const Color(0xff797979)),
                        enabledBorder: textFieldBorder(const Color(0xff797979)),
                        errorBorder: textFieldBorder(const Color(0xffFF3636)),
                        focusedErrorBorder: textFieldBorder(const Color(0xffFF3636)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Problem Title',
                        hintStyle: GoogleFonts.inter(
                            color: const Color(0xffBCBCBC),
                            fontWeight: FontWeight.w400,
                            fontSize: 17
                        ),
                        errorStyle: GoogleFonts.inter(
                            color: const Color(0xffFF3636),
                            fontWeight: FontWeight.w400,
                            fontSize: 13
                        ),

                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Необходимо заполнить поле';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: descriptionController,
                      cursorColor: const Color(0xFF8C8C8C),
                      maxLines: null,
                      maxLength: 1500,
                      expands: true,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          border: textFieldBorder(const Color(0xff797979)),
                          focusedBorder: textFieldBorder(const Color(0xff797979)),
                          disabledBorder: textFieldBorder(const Color(0xff797979)),
                          enabledBorder: textFieldBorder(const Color(0xff797979)),
                          errorBorder: textFieldBorder(const Color(0xffFF3636)),
                          focusedErrorBorder: textFieldBorder(const Color(0xffFF3636)),
                          hintText: 'Problem Description',
                          fillColor: Colors.white,
                          hintStyle: GoogleFonts.inter(
                              color: const Color(0xffBCBCBC),
                              fontWeight: FontWeight.w400,
                              fontSize: 17
                          ),
                          errorStyle: GoogleFonts.inter(
                              color: const Color(0xffFF3636),
                              fontWeight: FontWeight.w400,
                              fontSize: 13
                          ),
                          constraints: const BoxConstraints(
                              minHeight: 300,
                              maxHeight: 300
                          )
                      ),
                      onChanged: (value){
                        setState(() {

                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Location',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: FlutterMap(
                        options: MapOptions(
                            initialCenter: ref.watch(locationProvider),
                            initialZoom: 15,
                            interactionOptions: const InteractionOptions(
                                flags: InteractiveFlag.none
                            ),
                            onTap: (TapPosition tapPosition, LatLng latLng){
                              Get.to(
                                      () => const MapScreen()
                              );
                            }
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                width: 80.0,
                                height: 80.0,
                                point: ref.watch(locationProvider),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.red.shade500,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            sendIssueRequest = true;
                          });
                          await apiIssue.postIssue(ref.watch(photoPathProvider), titleController.text, descriptionController.text, ref.watch(locationProvider).longitude.toString(), ref.watch(locationProvider).latitude.toString(), ref);
                          setState(() {
                            titleController.text = '';
                            descriptionController.text = '';
                            sendIssueRequest = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xff056C5F),
                            splashFactory: NoSplash.splashFactory,
                            elevation: 0
                        ),
                        child: sendIssueRequest
                            ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                            : Text(
                          'Confirm',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

// void takePhoto(BuildContext context) async {
//   final path = join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
//   await cameraController.takePicture();
//
//   Navigator.push(context, MaterialPageRoute(builder: (builder) => const CameraViewPage()));
// }
}
