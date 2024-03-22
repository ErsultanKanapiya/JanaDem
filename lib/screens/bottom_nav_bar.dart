import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/screens/add_problem/add_problem_screen.dart';
import 'package:janadem/screens/gift/gifts_screen.dart';
import 'package:janadem/screens/home/home_screen.dart';
import 'package:janadem/screens/location/location_screen.dart';
import 'package:janadem/screens/profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final navBarController = StateProvider<PersistentTabController>((ref) => PersistentTabController(initialIndex: ref.watch(bottomNavBarIndexProvider)));
final bottomNavBarIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavBar extends ConsumerStatefulWidget {
  const  BottomNavBar({super.key});

  @override
  ConsumerState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {

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
          color: ref.watch(bottomNavBarIndexProvider) == 0
          ? const Color(0xff056C5F)
          : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}location.svg',
          color: ref.watch(bottomNavBarIndexProvider) == 1
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}plus.svg',
          color: ref.watch(bottomNavBarIndexProvider) == 2
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}gift.svg',
          color: ref.watch(bottomNavBarIndexProvider) == 3
              ? const Color(0xff056C5F)
              : const Color(0xff8B97A8),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          '${Assets().icn}profile.svg',
          color: ref.watch(bottomNavBarIndexProvider) == 4
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
            ref.watch(bottomNavBarIndexProvider.notifier).state = index;
          },
          selectedTabScreenContext: (BuildContext? tabContext) {
            _tabContext = tabContext;
          },
        ),
      ),
    );
  }
}
