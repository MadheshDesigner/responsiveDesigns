import 'package:flutter/material.dart';
import '../../../view/base/dimensions.dart';
import '../../base/styles.dart';

class PlannedProgramWidget extends StatelessWidget {
  const PlannedProgramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double widthSpace = widthSize > 600 ? 30 : 15;
    return Container(
      width:widthSize>600?342:339 ,
      height: widthSize>600?399:342,
      padding: const EdgeInsets.fromLTRB(14, 16, 14,0),
      margin: EdgeInsets.only(left: widthSize * 0.02,right: widthSize * 0.02,top: widthSize>600?5:10),
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
                          colors: [Color(0xff00AEBD), Color(0xff1D5BBF)]),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Planned Programs",
                      style: plusRegular.copyWith(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w600,
                        fontSize:  16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 77,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xffDFEDFF),
                    borderRadius: BorderRadius.circular(3)),
                child: Text(
                  "View All",
                  style: plusRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall(context),
                    color: Theme.of(context).cardColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xffD9D9D9)),
          const SizedBox(height: 15),
          rowItem(context, "327", "Programs", const Color(0xffFFF4DE),widthSpace),
          rowItem(context, "120", "Mentors", const Color(0xffC9F7F5), widthSpace),
          rowItem(context, "556", "Mentees", const Color(0xffEEE5FF),widthSpace),
        ],
      ),
    );
  }

  Widget rowItem(BuildContext context, String number, String label, Color color, double spacing) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 74,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              number,
              style: plusBlack.copyWith(
                fontSize: Dimensions.fontSizeExtraLarge(context),
                fontWeight: FontWeight.w700,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          SizedBox(width: spacing),
          Text(
            label,
            style: plusBold.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).cardColor,
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
