import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/screens/add_problem/camera_view_page.dart';
import 'package:janadem/screens/widgets/textform_widget.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// List<CameraDescription> cameras;

class AddProblemScreen extends ConsumerStatefulWidget {
  const AddProblemScreen({super.key});

  @override
  ConsumerState createState() => _AddProblemScreenState();
}

class _AddProblemScreenState extends ConsumerState<AddProblemScreen> {
  // late CameraController cameraController;
  //
  // late Future<void> cameraValue;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // cameraController = CameraController(cameras[0], ResolutionPreset.high);
    // cameraValue = cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    // cameraController.dispose();
    super.dispose();
  }

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
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade400
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
                            fontSize: 17.sp
                        ),
                        errorStyle: GoogleFonts.inter(
                            color: const Color(0xffFF3636),
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp
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
                              fontSize: 17.sp
                          ),
                          errorStyle: GoogleFonts.inter(
                              color: const Color(0xffFF3636),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp
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
                      padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Location',
                       style: GoogleFonts.inter(
                         fontSize: 15,
                         color: Colors.black,
                         fontWeight: FontWeight.w500
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
