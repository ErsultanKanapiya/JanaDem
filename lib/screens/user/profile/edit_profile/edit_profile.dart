import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/requests/edit_profile/edit_profile.dart';
import 'package:janadem/screens/widgets/progress_indicator.dart';
import 'package:janadem/screens/widgets/textform_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {

  final dio = Dio(BaseOptions());
  late final ApiEditProfile apiEditProfile = ApiEditProfile(DioClient(dio));

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '+#(###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
  );

  Map data = {};

  bool saveButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.inter(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C2C2C)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        cursorColor: const Color(0xff1A1B22),
                        cursorWidth: 1,
                        cursorHeight: 20,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.text,
                        controller: nameController,
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
                          hintText: 'Name',
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
                            return 'It is necessary to fill in the field';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Surname',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C2C2C)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        cursorColor: const Color(0xff1A1B22),
                        cursorWidth: 1,
                        cursorHeight: 20,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.text,
                        controller: surnameController,
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
                          hintText: 'Surname',
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
                            return 'It is necessary to fill in the field';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C2C2C)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        cursorColor: const Color(0xff1A1B22),
                        cursorWidth: 1,
                        cursorHeight: 20,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.text,
                        controller: phoneNumberController,
                        inputFormatters: [maskFormatter],
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
                          hintText: 'Phone Number',
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
                            return 'It is necessary to fill in the field';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C2C2C)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        cursorColor: const Color(0xff1A1B22),
                        cursorWidth: 1,
                        cursorHeight: 20,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
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
                          hintText: 'Email',
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
                            return 'It is necessary to fill in the field';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(formKey.currentState!.validate()){
                          data = {
                            'first_name': nameController.text,
                            'last_name': surnameController.text,
                            'phone_number': phoneNumberController.text.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '').replaceAll('-', ''),
                            'email': emailController.text
                          };

                          setState(() {
                            saveButtonPressed = true;
                          });
                          await apiEditProfile.editProfileInfo(data);
                          setState(() {
                            saveButtonPressed = false;
                          });
                        }


                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color(0xff056C5F),
                          splashFactory: NoSplash.splashFactory,
                          elevation: 0
                      ),
                      child: saveButtonPressed
                      ? whiteProgressIndicator()
                      : Text(
                        'Save',
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
      ),
    );
  }
}
