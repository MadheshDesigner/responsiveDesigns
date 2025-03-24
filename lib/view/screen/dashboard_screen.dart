import 'package:flutter/material.dart';
import '../../../view/base/images.dart';
import '../../../view/screen/widgets/planned_program_widget.dart';
import '../../../view/screen/widgets/program_mode_matrics_widget.dart';
import '../../../view/screen/widgets/program_status_matrics_widget.dart';
import '../../../view/screen/widgets/program_type_metrics_widget.dart';
import '../../../view/screen/widgets/top_mentors_widget.dart';
import '../../../view/screen/widgets/top_program_widget.dart';

import 'navigation_drawer_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth > 600 ? 30 : 24;
    double spacing = screenWidth > 600 ? 15 : 10;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 0,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor:  Colors.white,
            surfaceTintColor:Colors.white,
            elevation: 0,
            title: Container(
              width:  30,
              height:  30,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Theme.of(context).primaryColor, width: 2.5),
                image: const DecorationImage(
                  image: AssetImage(Images.profile_image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: const Color(0xffEEF5FF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child:
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Images.search,
                          width: iconSize * 0.7,
                          height: iconSize * 0.7,
                          fit: BoxFit.cover,
                          color: Theme.of(context).secondaryHeaderColor)
                ),
              ),
              SizedBox(width: screenWidth > 600 ? 20 : 15),
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: const Color(0xffEEF5FF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Images.notification,
                          width: iconSize * 0.7,
                          height: iconSize * 0.7,
                          fit: BoxFit.cover,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    Positioned(
                      top: 5,
                      left: iconSize * 0.60,
                      child: Container(
                        width: 7.5,
                        height: 7.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xffFD003A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: spacing),
              GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(Images.meu_bar,
                      height: 14,
                      width: 20,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: spacing),
            ],
          ),
        ),
      ),
      endDrawer: const NavigationDrawerScreen(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return const Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 20,
                alignment: WrapAlignment.start,
                children: [
                  PlannedProgramWidget(),
                  ProgramStatusMatricWidget(),
                  TopProgramWidget(),
                  TopMentorsWidget(),
                  ProgramTypeMetrics(),
                  ProgramModeMetrics(),
                ],
              ),
            )

          );
        },
      ),
    );
  }
}
