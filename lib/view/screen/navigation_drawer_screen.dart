import 'package:flutter/material.dart';
import '../../../view/base/dimensions.dart';
import '../../../view/base/styles.dart';
import '../base/images.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenWidth>600?397:269,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18,left: 18),
              child: Text("Admin",style: plusRegular.copyWith(fontWeight: FontWeight.w700,fontSize: Dimensions.fontSizeOverLarge(context),color: Theme.of(context).primaryColor),),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 639,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity( 0.05),
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 81,
                        height:  81,
                        margin: const EdgeInsets.only(left: 10,top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Theme.of(context).primaryColor, width: 4.5),
                          image: const DecorationImage(
                            image: AssetImage(Images.profile_image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Center(child: Text("John Doe",style: plusRegular.copyWith(fontWeight: FontWeight.w500,fontSize:Dimensions.fontSizeDefault(context),color: Theme.of(context).cardColor ),)),
                    const SizedBox(height: 10,),
                    Center(child: Text("Mentor",style: plusRegular.copyWith(fontWeight: FontWeight.w300,fontSize:Dimensions.fontSizeSmall(context),color: const Color(0xff232323) ),)),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Color(0xffD9D9D9),
                    ),
                    const SizedBox(height: 15),
                    rowDataIcon(Images.sheduler,"Sheduler",context),
                    const SizedBox(height: 35),
                    rowDataIcon(Images.time_sheet,"TimeSheet",context),
                    const SizedBox(height: 35),
                    rowDataIcon(Images.discussion,"Discussion",context),
                    const SizedBox(height: 35),
                    rowDataIcon(Images.reports,"Report",context),
                    const SizedBox(height: 35),
                    rowDataIcon(Images.feedback,"Feedback",context),
                    const SizedBox(height: 35),
                    rowDataIcon(Images.certificate,"Certificates",context),
                    const SizedBox(height: 35),
                    rowDataIcon(Images.feed,"Feed",context),
                    const SizedBox(height: 35),
                    rowDataIcon(Images.analytics,"Analytics",context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowDataIcon(String image,String name,BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          const SizedBox(width: 20),
          Image(image: AssetImage(image),width: 22,height: 22,fit: BoxFit.fill,),
          const SizedBox(width: 20),
          Text(name,style: plusRegular.copyWith(fontWeight: FontWeight.w500,fontSize: Dimensions.fontSizeDefault(context),color: Theme.of(context).cardColor),)
        ],
      ),
    );
  }
}
