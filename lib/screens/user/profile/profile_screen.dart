import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/constants/hive_boxes.dart';
import 'package:janadem/screens/splash_screen.dart';
import 'package:janadem/screens/user/profile/edit_profile/edit_profile.dart';
import 'package:janadem/screens/user/profile/language/language_screen.dart';
import 'package:janadem/screens/user/profile/notifications/notifications_change.dart';
import 'package:janadem/screens/user/profile/privacy_policy/privacy_profile.dart';
import 'package:janadem/screens/widgets/wait_alert.dart';

import '../../bottom_nav_bar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.black,
                )
            )
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('${Assets().img}ava.jpg'),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    '${acc.get('user')['first_name']} ${acc.get('user')['last_name']}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                  ),
                ),
                Text(
                  'Kazakhstan, Almaty | ${acc.get('user')['phone_number']}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('${Assets().icn}coins.svg'),
                      Text(
                        '${acc.toMap()['user']['balance']} coins',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),

                mainContainer(
                  rowOfElements('merch_store', 'Merch store', false, Container(), () => showWaitingAlert(context)),
                ),

                mainContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        rowOfElements('help_and_support', 'Help & Support', false, Container(), () => showWaitingAlert(context)),
                        rowOfElements('contact_us', 'Contact us', false, Container(), () => showWaitingAlert(context)),
                        rowOfElements('privacy_policy', 'Privacy policy', false, Container(), (){
                          Get.to(
                              () => const PrivacyPolicy()
                          );
                        }),
                      ],
                    )
                ),

                mainContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        rowOfElements('edit_profile', 'Edit profile information', false, Container(), (){
                          Get.to(
                              () => const EditProfileScreen()
                          );
                        }),
                        rowOfElements('notification', 'Notifications', true,
                            Text(
                              'ON',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: const Color(0xff056C5F)
                              ),
                            ),
                                () => showWaitingAlert(context)),
                        rowOfElements('language', 'Language', true,
                            Text(
                              'English',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: const Color(0xff056C5F)
                              ),
                            ), () => showWaitingAlert(context)),
                      ],
                    )
                ),

                mainContainer(
                    InkWell(
                      onTap: (){
                        acc.clear();
                        ref.watch(userBottomNavBarIndexProvider.notifier).state = 0;
                        Get.offAll(
                            () => const SplashScreen()
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('${Assets().icn}logout.svg'),
                            const SizedBox(
                                width: 12
                            ),
                            Text(
                              'Log out',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffEB4335)
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),


              ],
            ),
          ),
        )
    );
  }

  Widget mainContainer(Widget element){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]
      ),
      child: element,
    );
  }

  Widget rowOfElements(String icon, String title, bool suffixExists, Widget suffixWidget, void Function() onTap){
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('${Assets().icn}$icon.svg'),
                const SizedBox(
                    width: 12
                ),
                Text(
                  title,
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),
                ),
              ],
            ),
            suffixExists
                ? suffixWidget
                : Container()
          ],
        ),
      ),
    );
  }


}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height;
    final width = size.width;
    final curveHeight = height * 0.1;

    path.lineTo(0, height - curveHeight);
    path.quadraticBezierTo(width / 4, height, width / 2, height);
    path.quadraticBezierTo(3 * width / 4, height, width, height - curveHeight);
    path.lineTo(width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}