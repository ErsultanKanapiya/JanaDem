import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/screens/akim/akim_bottom_nav_bar.dart';
import 'package:janadem/screens/bottom_nav_bar.dart';
import 'package:janadem/screens/user/auth/forgot_password/forgot_password.dart';
import 'package:janadem/screens/widgets/textform_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AkimLoginScreen extends StatefulWidget {
  const AkimLoginScreen({super.key});

  @override
  State<AkimLoginScreen> createState() => _AkimLoginScreenState();
}

class _AkimLoginScreenState extends State<AkimLoginScreen> {

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '+#(###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
  );

  bool passwordVisible = true;

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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SvgPicture.asset('${Assets().img}logo_white.svg', color: const Color(0xff056C5F)),
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.inter(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C2C2C)
                      ),
                    ),
                    Text(
                      'Welcome Government!',
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
                          'Citizen name',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff2C2C2C)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: emailController,
                            cursorColor: const Color(0xff1A1B22),
                            cursorWidth: 1,
                            cursorHeight: 20,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: const Color(0xff1A1B22)
                            ),
                            decoration: InputDecoration(
                              border: textFieldBorder(const Color(0xff797979)),
                              focusedBorder: textFieldBorder(const Color(0xff797979)),
                              disabledBorder: textFieldBorder(const Color(0xff797979)),
                              enabledBorder: textFieldBorder(const Color(0xff797979)),
                              errorBorder: textFieldBorder(const Color(0xffFF3636)),
                              focusedErrorBorder: textFieldBorder(const Color(0xffFF3636)),
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              hintText: 'government@email.com',
                              fillColor: Colors.white,
                              hintStyle: GoogleFonts.inter(
                                color: const Color(0xffBCBCBC),
                                fontSize: 17,
                              ),
                              errorStyle: GoogleFonts.inter(
                                color: const Color(0xffFF3636),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Необходимо заполнить поле';
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
                                return 'Необходимо заполнить поле';
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.to(
                                      () => const ForgotPasswordScreen()
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff2C2C2C)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            if(formKey.currentState!.validate()){
                              Get.offAll(
                                      () => const AkimBottomNavBar()
                              );
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
                          child: Text(
                            'Login',
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
        ),
      ),
    );
  }
}
