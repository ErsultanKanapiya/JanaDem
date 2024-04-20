import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/hive_boxes.dart';
import 'package:janadem/dio/dio_client.dart';
import 'package:janadem/models/issue/issue_model.dart';
import 'package:janadem/requests/issue/change_status.dart';
import 'package:janadem/requests/issue/get_issue.dart';
import 'package:janadem/screens/widgets/progress_indicator.dart';

class IssueDetails extends ConsumerStatefulWidget {
  final int id;
  const IssueDetails(this.id, {super.key});

  @override
  ConsumerState createState() => _IssueDetailsState();
}

class _IssueDetailsState extends ConsumerState<IssueDetails> {

  final dio = Dio(BaseOptions());
  late final ApiGetIssue apiGetIssue = ApiGetIssue(DioClient(dio));
  late final ApiChangeStatus apiChangeStatus = ApiChangeStatus(DioClient(dio));

  IssueModel? issueModel;
  bool getIssueRequest = false;
  bool statusChanging = false;

  @override
  void initState() {
    getIssueData();
    super.initState();
  }

  Future<void> getIssueData() async {
    setState(() {
      getIssueRequest = true;
    });
    issueModel = (await apiGetIssue.getIssue(widget.id))!;
    if(issueModel != null){
      setState(() {
        getIssueRequest = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Problem',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: getIssueRequest
            ? greenProgressIndicator()
            : Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: Image.network(
                      issueModel!.image,
                      fit: BoxFit.fitHeight,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  issueModel!.title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Problem description',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      issueModel!.description,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              acc.get('user') != null
                  ? issueModel!.next_statuses.isNotEmpty
                  ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: issueModel!.next_statuses.length,
                  itemBuilder: (context, index) {
                    final status = issueModel!.next_statuses[index];
                    return buttonWidget(status.status, status.id);
                  }
              )
                  : Container()
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonWidget(String text, String id) {


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () async {
            setState(() {
              statusChanging = true;
            });
            await apiChangeStatus.changeIssueStatus(widget.id, id, ref);
            setState(() {
              statusChanging = false;
            });
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: const Color(0xff056C5F),
              splashFactory: NoSplash.splashFactory,
              elevation: 0
          ),
          child: statusChanging
              ? whiteProgressIndicator()
              : Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
