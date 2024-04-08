import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/screens/user/add_problem/add_problem_screen.dart';
import 'package:janadem/screens/user/gift/gifts_screen.dart';
import 'package:janadem/screens/user/home/home_screen.dart';
import 'package:janadem/screens/user/location/location_screen.dart';
import 'package:janadem/screens/user/profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final navBarController = StateProvider<PersistentTabController>((ref) => PersistentTabController(initialIndex: ref.watch(userBottomNavBarIndexProvider)));
final userBottomNavBarIndexProvider = StateProvider<int>((ref) => 0);

class UserBottomNavBar extends ConsumerStatefulWidget {
  const  UserBottomNavBar({super.key});

  @override
  ConsumerState createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends ConsumerState<UserBottomNavBar> {

  BuildContext? _tabContext;


  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = [
      const HomeScreen(),
      const LocationScreen(),
      const AddProblemScreen(),
      const GiftsScreen(),
      const ProfileScreen(),
    ];

    final List<PersistentBottomNavBarItem> navBarItems = [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}home.svg',
          color: ref.watch(userBottomNavBarIndexProvider) == 0
          ? const Color(0xff056C5F)
          : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}location.svg',
          color: ref.watch(userBottomNavBarIndexProvider) == 1
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}plus.svg',
          color: ref.watch(userBottomNavBarIndexProvider) == 2
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}gift.svg',
          color: ref.watch(userBottomNavBarIndexProvider) == 3
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}profile.svg',
          color: ref.watch(userBottomNavBarIndexProvider) == 4
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
          controller: ref.watch(navBarController),
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
            ref.watch(userBottomNavBarIndexProvider.notifier).state = index;
          },
          selectedTabScreenContext: (BuildContext? tabContext) {
            _tabContext = tabContext;
          },
        ),
      ),
    );
  }
}
