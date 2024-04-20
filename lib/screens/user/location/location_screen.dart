import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/requests/appProviders/issue/issues_state_provider.dart';
import 'package:janadem/screens/user/location/issue_details.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final tabBarIndexControllerProvider = StateProvider.autoDispose<int>((ref) => 0);

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> with SingleTickerProviderStateMixin {

  TextEditingController searchController = TextEditingController();

  late TabController _tabController;

  @override
  void didChangeDependencies() {
    _tabController = TabController(initialIndex: ref.read(tabBarIndexControllerProvider), length: 3, vsync: this);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final issues = ref.watch(issuesDataProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Problem location',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   width: double.infinity,
            //   height: 50,
            //   margin: const EdgeInsets.symmetric(horizontal: 20),
            //   child: TextFormField(
            //     textAlignVertical: TextAlignVertical.center,
            //     keyboardType: TextInputType.text,
            //     controller: searchController,
            //     decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: const BorderSide(color: Color(0xFFE3E5E5))
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: const BorderSide(color: Color(0xFFE3E5E5))
            //         ),
            //         filled: true,
            //         fillColor: Colors.white,
            //         suffixIcon: SvgPicture.asset('${Assets().icn}search.svg', height: 20, width: 20, fit: BoxFit.scaleDown),
            //         hintText: 'Search here',
            //         hintStyle: GoogleFonts.inter(
            //             color: const Color(0xff64748B),
            //             fontWeight: FontWeight.w400,
            //             fontSize: 16
            //         )
            //
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                isScrollable: false,
                splashFactory: NoSplash.splashFactory,
                controller: _tabController,
                labelColor: Colors.black,
                tabAlignment: TabAlignment.fill,
                unselectedLabelColor: const Color(0xff64748B),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 5,
                      color: Color(0xff056C5F),
                    )
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'All',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Progress',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Success',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    issues.isLoading
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff056C5F),
                      ),
                    )
                        : RefreshIndicator(
                      color: const Color(0xff056C5F),
                      onRefresh: () {
                        return Future.delayed(const Duration(seconds: 1), () {
                          ref.invalidate(issuesDataProvider);
                        }
                        );
                      },
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: issues.issues!.issuesList.length,
                          itemBuilder: (context, index){
                            final singleIssue = issues.issues!.issuesList[index];
                            return GestureDetector(
                              onTap: (){
                                PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: IssueDetails(singleIssue.id),
                                    withNavBar: true
                                );
                              },
                              child: Container(
                                height: 180,
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.blueAccent)
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                          height: 170,
                                          width: 130,
                                          child: Image.network(
                                            singleIssue.image,
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                    ),

                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                singleIssue.title,
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                singleIssue.description,
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),

                                              const SizedBox(height: 10),

                                              Text(
                                                '${singleIssue.longitude}, ${singleIssue.latitude}',
                                                softWrap: true,
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                    issues.isLoading
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff056C5F),
                      ),
                    )
                        : RefreshIndicator(
                      color: const Color(0xff056C5F),
                      onRefresh: () {
                        return Future.delayed(const Duration(seconds: 1), () {
                          ref.invalidate(issuesDataProvider);
                        }
                        );
                      },
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: issues.issues!.issuesList.length,
                          itemBuilder: (context, index){
                            final singleIssue = issues.issues!.issuesList[index];
                            return singleIssue.status == 'IN_PROGRESS'
                                ? Container(
                              height: 180,
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                        height: 170,
                                        width: 130,
                                        child: Image.network(
                                          singleIssue.image,
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),

                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              singleIssue.title,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              singleIssue.description,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),

                                            const SizedBox(height: 10),

                                            Text(
                                              '${singleIssue.longitude}, ${singleIssue.latitude}',
                                              softWrap: true,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                            )
                                : Container();
                          }
                      ),
                    ),
                    issues.isLoading
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff056C5F),
                      ),
                    )
                        : RefreshIndicator(
                      color: const Color(0xff056C5F),
                      onRefresh: () {
                        return Future.delayed(const Duration(seconds: 1), () {
                          ref.invalidate(issuesDataProvider);
                        }
                        );
                      },
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: issues.issues!.issuesList.length,
                          itemBuilder: (context, index){
                            final singleIssue = issues.issues!.issuesList[index];
                            return singleIssue.status == 'APPROVED'
                                ? Container(
                              height: 180,
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                        height: 170,
                                        width: 130,
                                        child: Image.network(
                                          singleIssue.image,
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),

                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              singleIssue.title,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              singleIssue.description,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),

                                            const SizedBox(height: 10),

                                            Text(
                                              '${singleIssue.longitude}, ${singleIssue.latitude}',
                                              softWrap: true,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                            )
                                : Container();
                          }
                      ),
                    ),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}