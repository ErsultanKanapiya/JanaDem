import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/requests/auth/register/register.dart';
import 'package:janadem/screens/user/auth/login/login_screen.dart';
import 'package:janadem/screens/widgets/textform_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatefulWidget {
  final int status;
  const SignUpScreen({super.key, required this.status});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final dio = Dio(BaseOptions());
  late final ApiRegister apiRegister = ApiRegister(DioClient(dio));

  final formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '+#(###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
  );

  bool passwordVisible = true;
  bool passwordConfirmVisible = true;

  bool registerButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerDown: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: GoogleFonts.inter(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C2C2C)
                      ),
                    ),
                    Text(
                      'Kindly enter your details',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff2C2C2C)
                      ),
                    ),

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
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                              errorMaxLines: 2,
                              hintText: 'Name',
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xffBCBCBC),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
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
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            cursorColor: const Color(0xff1A1B22),
                            cursorWidth: 1,
                            cursorHeight: 20,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            controller: lastnameController,
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
                              errorMaxLines: 2,
                              hintText: 'Surname',
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xffBCBCBC),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
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
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: phoneNumberController,
                            cursorColor: const Color(0xff1A1B22),
                            cursorWidth: 1,
                            cursorHeight: 20,
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: const Color(0xff1A1B22)
                            ),
                            inputFormatters: [maskFormatter],
                            decoration: InputDecoration(
                              border: textFieldBorder(const Color(0xff797979)),
                              focusedBorder: textFieldBorder(const Color(0xff797979)),
                              disabledBorder: textFieldBorder(const Color(0xff797979)),
                              enabledBorder: textFieldBorder(const Color(0xff797979)),
                              errorBorder: textFieldBorder(const Color(0xffFF3636)),
                              focusedErrorBorder: textFieldBorder(const Color(0xffFF3636)),
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              hintText: '+7(701) 000-00-00',
                              fillColor: Colors.white,
                              errorMaxLines: 2,
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xffBCBCBC),
                                fontSize: 14,
                              ),
                              errorStyle: GoogleFonts.inter(
                                color: const Color(0xffFF3636),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'It is necessary to fill in the field';
                              } else if (value.length != 17) {
                                return 'Incorrect data';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value){

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
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                              errorMaxLines: 2,
                              hintText: 'Email',
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xffBCBCBC),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
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
                          'Date of birth',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff2C2C2C)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            cursorColor: const Color(0xff1A1B22),
                            cursorWidth: 1,
                            cursorHeight: 20,
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.datetime,
                            controller: dateOfBirthController,
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
                              errorMaxLines: 2,
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context, 
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      locale: const Locale('en')
                                    );

                                    if(pickedDate != null ){
                                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

                                      setState(() {
                                        dateOfBirthController.text = formattedDate;
                                      });
                                    }
                                  },
                                  child: SvgPicture.asset('${Assets().icn}calendar.svg', height: 20, width: 20, fit: BoxFit.scaleDown, color: const Color(0xff1F1F1F))
                              ),
                              hintText: 'DD/MM/YYYY',
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xffBCBCBC),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
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
                          'Password',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff2C2C2C)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            cursorColor: const Color(0xff1A1B22),
                            cursorWidth: 1,
                            cursorHeight: 20,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            obscureText: passwordVisible,
                            controller: passwordController,
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
                              errorMaxLines: 2,
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                child: !passwordVisible
                                    ? SvgPicture.asset('${Assets().icn}visible.svg', height: 20, width: 20, fit: BoxFit.scaleDown, color: const Color(0xff1F1F1F))
                                    : SvgPicture.asset('${Assets().icn}not_visible.svg', height: 20, width: 20, fit: BoxFit.scaleDown, color: const Color(0xff1F1F1F)),
                              ),
                              hintText: 'Input your password',
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xffBCBCBC),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
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
                              } else if (value.length < 8) {
                                return 'Password must be longer than 8 characters';
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
                          'Confirm Password',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff2C2C2C)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            cursorColor: const Color(0xff1A1B22),
                            cursorWidth: 1,
                            cursorHeight: 20,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            obscureText: passwordConfirmVisible,
                            controller: passwordConfirmController,
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
                              errorMaxLines: 2,
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    passwordConfirmVisible = !passwordConfirmVisible;
                                  });
                                },
                                child: !passwordConfirmVisible
                                    ? SvgPicture.asset('${Assets().icn}visible.svg', height: 20, width: 20, fit: BoxFit.scaleDown, color: const Color(0xff1F1F1F))
                                    : SvgPicture.asset('${Assets().icn}not_visible.svg', height: 20, width: 20, fit: BoxFit.scaleDown, color: const Color(0xff1F1F1F)),
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xffBCBCBC),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
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
                              } else if (value != passwordController.text) {
                                return 'Passwords don\'t match';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            if(formKey.currentState!.validate()){
                              setState(() {
                                registerButtonPressed = true;
                              });
                              final parsedDate = DateFormat('MM/dd/yyyy').parse(dateOfBirthController.text);
                              await apiRegister.register(nameController.text, lastnameController.text, phoneNumberController.text, emailController.text, DateFormat('yyyy-MM-dd').format(parsedDate), passwordController.text);
                              setState(() {
                                registerButtonPressed = false;
                              });
                            } else {

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
                          child: registerButtonPressed
                              ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                          : Text(
                            'Sign Up',
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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff2C2C2C)
                            ),
                          ),
                          const SizedBox(width: 3),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(
                                      () => const LoginScreen(status: 1)
                              );
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff469BD8)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
