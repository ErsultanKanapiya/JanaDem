import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/screens/akim/home/akim_home_screen.dart';
import 'package:janadem/screens/akim/list_checks_screen/akim_list_checks.dart';
import 'package:janadem/screens/akim/location/akim_location_screen.dart';
import 'package:janadem/screens/akim/profile_screen/akim_profile_screen.dart';
import 'package:janadem/screens/user/add_problem/camera_page.dart';
import 'package:janadem/screens/user/gift/gifts_screen.dart';
import 'package:janadem/screens/user/profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final akimNavBarController = StateProvider<PersistentTabController>((ref) => PersistentTabController(initialIndex: ref.watch(akimBottomNavBarIndexProvider)));
final akimBottomNavBarIndexProvider = StateProvider<int>((ref) => 0);

class AkimBottomNavBar extends ConsumerStatefulWidget {
  const  AkimBottomNavBar({super.key});

  @override
  ConsumerState createState() => _AkimBottomNavBarState();
}

class _AkimBottomNavBarState extends ConsumerState<AkimBottomNavBar> {

  BuildContext? _tabContext;


  @override
  Widget build(BuildContext context) {


    final List<Widget> screens = [
      const AkimHomeScreen(),
      const AkimLocationScreen(),
      const AkimListChecks(),
      const AkimProfileScreen(),
    ];

    final List<PersistentBottomNavBarItem> navBarItems = [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}home.svg',
          color: ref.watch(akimBottomNavBarIndexProvider) == 0
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}location.svg',
          color: ref.watch(akimBottomNavBarIndexProvider) == 1
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}list_checks.svg',
          color: ref.watch(akimBottomNavBarIndexProvider) == 2
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}profile.svg',
          color: ref.watch(akimBottomNavBarIndexProvider) == 3
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: PersistentTabView(
          context,
          controller: ref.watch(akimNavBarController),
          screens: screens,
          items: navBarItems,
          navBarHeight: 45,
          backgroundColor: Colors.white,
          navBarStyle: NavBarStyle.simple,
          padding: const NavBarPadding.all(5),
          decoration: const NavBarDecoration(
              border: Border(
                  top: BorderSide(width: 1, color: Colors.black12)
              )
          ),
          onItemSelected: (int index){
            ref.watch(akimBottomNavBarIndexProvider.notifier).state = index;
          },
          selectedTabScreenContext: (BuildContext? tabContext) {
            _tabContext = tabContext;
          },
        ),
      ),
    );
  }
}
