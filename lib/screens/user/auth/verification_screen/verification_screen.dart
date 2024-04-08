import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>  {

  final formKey = GlobalKey<FormState>();

  final TextEditingController pinEditingController = TextEditingController();

  late CountdownTimerController countdownController;
  int duration = 300;

  bool buttonTapped = false;
  bool sendAgainButtonTapped = false;

  bool countDownView = true;

  @override
  void initState() {
    countdownController = CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch + duration * 1000,
      onEnd: () {
        setState(() {
          countDownView = false;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pinEditingController.dispose();
    countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Verification',
                        style: GoogleFonts.inter(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff2C2C2C)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'We sent you a code to verify your phone number',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff2C2C2C)
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Pinput(
                              controller: pinEditingController,
                              length: 4,
                              defaultPinTheme: PinTheme(
                                width: 60,
                                height: 60,
                                textStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23,
                                    color: Colors.black
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 60,
                                height: 60,
                                textStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23,
                                    color: Colors.black
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black,
                                      width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) async{
                                // if(pinEditingController.text.length==4){
                                //   setState(() {
                                //     buttonTapped = true;
                                //   });
                                //   await login.loginNew(widget.phoneNumber, pinEditingController.text, ref);
                                // }
                              },
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
                            'Verify code',
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
                      child: TextButton(
                        onPressed: () async{

                        },
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Colors.transparent)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Expires in ',
                              style: GoogleFonts.inter(
                                color: const Color(0xff94A3B8),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            countDownView
                                ? CountdownTimer(
                              endWidget: Container(),
                              controller: countdownController,
                              widgetBuilder: (_, CurrentRemainingTime? time) {
                                return Text(
                                  '${time!.min!<10 ? '0${time.min}' : time.min}:${time.sec!<10 ? '0${time.sec}' : time.sec}s',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xff94A3B8),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
                              textStyle: GoogleFonts.inter(
                                color: const Color(0xff94A3B8),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                                : Container(),
                          ],
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
