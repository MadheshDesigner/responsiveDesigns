import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../view/base/styles.dart';
import '../../base/dimensions.dart';

class ProgramTypeMetrics extends StatelessWidget {
  const ProgramTypeMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return Container(
      width:widthSize>600?342:339 ,
      height: widthSize>600?415:417,
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      margin: EdgeInsets.only(left: widthSize * 0.02,right: widthSize * 0.02,top: widthSize>600?5:5,bottom:  widthSize>600?30:0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            blurRadius: 14,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 25,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff00AEBD), Color(0xff1D5BBF)],
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Program Type Metrics",
                      style: plusRegular.copyWith(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 76,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffDFEDFF),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 7),
                    Text(
                      "Month",
                      style: plusRegular.copyWith(
                        fontSize: Dimensions.fontSizeSmall(context),
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xffD9D9D9)),
          const SizedBox(height: 15),
          Center(
            child: SizedBox(
              height: 265,
              width: 265,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 90,
                      startDegreeOffset: -54,
                      sections: [
                        PieChartSectionData(
                          color: Theme.of(context).primaryColor,
                          value: 25,
                          title: '',
                          radius: 32,
                        ),
                        PieChartSectionData(
                          color: const Color(0xffFFBB00),
                          value: 20,
                          title: '',
                          radius: 32,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Total Programs",
                        style: plusRegular.copyWith(
                          color: Theme.of(context).cardColor,
                          fontSize: Dimensions.fontSizeLarge(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "94",
                        style: plusRegular.copyWith(
                          color: Theme.of(context).cardColor,
                          fontSize: Dimensions.fontSizeOver(context),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textWidget(const Color(0xffFFBB00), "Premium", "40", context),
              const SizedBox(width: 20),
              textWidget(Theme.of(context).primaryColor, "Free", "54", context),
            ],
          ),
        ],
      ),
    );
  }

  Widget textWidget(Color color, String label, String count, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 16),
        const SizedBox(width: 5),
        Text(
          label,
          style: plusRegular.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.fontSizeDefault(context),
            color: Theme.of(context).cardColor,
          ),
        ),
        const SizedBox(width: 18),
        Text(
          count,
          style: plusRegular.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.fontSizeLarge(context),
            color: Theme.of(context).cardColor,
          ),
        ),
      ],
    );
  }
}
