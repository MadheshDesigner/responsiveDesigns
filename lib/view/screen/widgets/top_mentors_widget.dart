import 'package:flutter/material.dart';
import '../../../view/base/images.dart';
import '../../base/dimensions.dart';
import '../../base/styles.dart';

class TopMentorsWidget extends StatefulWidget {
  const TopMentorsWidget({super.key});

  @override
  State<TopMentorsWidget> createState() => _TopMentorsWidgetState();
}

class _TopMentorsWidgetState extends State<TopMentorsWidget> {
  final ScrollController scrollController = ScrollController();
  double scrollProgress = 0.2;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollProgressUpdate);
  }

  void scrollProgressUpdate() {
    if (!scrollController.hasClients) return;

    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.offset;

    setState(() {
      scrollProgress = (currentScroll / maxScroll).clamp(0.2, 1.0);
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollProgressUpdate);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width > 600 ?MediaQuery.of(context).size.width:339,
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      margin: EdgeInsets.only(left: screenWidth * 0.02,right: screenWidth * 0.02,top: screenWidth>600?5:5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity( 0.06),
            offset: const Offset(3.75, 3.75),
            blurRadius: 14,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
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
                          colors: [Color(0xff00AEBD), Color(0xff1D5BBF)]),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Top Mentors", style: plusRegular.copyWith(color: Theme
                        .of(context)
                        .cardColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),),
                  ),
                  const SizedBox(width: 10,),
                  const Image(image: AssetImage(Images.open_view_icon),
                    width: 12,
                    height: 12,)
                ],
              ),
              Container(
                width: 77,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xffDFEDFF),
                    borderRadius: BorderRadius.circular(3)
                ),
                child: Text("View All", style: plusRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall(context), color: Theme
                    .of(context)
                    .cardColor),),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xffD9D9D9),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffD9D9D9),),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: DataTable(
                border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 1, color: Colors.grey.shade100),
                ),

                columnSpacing: 30,
                dataRowMinHeight: 50,
                dataRowMaxHeight: 70,
                headingRowColor: WidgetStateProperty.all(
                    const Color(0xffD9E4F2)),
                columns: [
                  DataColumn(label: Text(
                      "Mentor Name", style: styleHeader(context))),
                  DataColumn(
                      label: Text("Program", style: styleHeader(context))),
                  DataColumn(
                      label: Text("Email", style: styleHeader(context))),
                  DataColumn(
                      label: Text("Rating", style: styleHeader(context))),
                  DataColumn(label: Text("View", style: styleHeader(context))),
                ],
                rows: rowDataWidget(context),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: scrollProgress,
              backgroundColor: Colors.grey.withOpacity(0.3),
              valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).cardColor),
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle styleHeader(BuildContext context) {
    return plusBold.copyWith(fontWeight: FontWeight.w500,
        fontSize: Dimensions.fontSizeLarge(context),
        color: Theme
            .of(context)
            .cardColor);
  }

  List<DataRow> rowDataWidget(BuildContext context) {
    List<Map<String, String>> data = [
      {
        "program": "Jonh Kennedy",
        "category": "Teaching Program",
        "createdBy": "johnk@gmail.com",
        "rating":"4.9"
      },
      {
        "program": "Jenifer Smith",
        "category": "Teaching Program",
        "createdBy": "jenny@gmail.com",
        "rating":"4.8"
      },
      {
        "program": "Thomas shelby",
        "category": "Teaching Program",
        "createdBy": "thomas@gmail.com",
        "rating":"4.7"
      },
      {
        "program": "John Miller",
        "category": "Teaching Program",
        "createdBy": "miller@gmail.com",
        "rating":"4.5"
      },
      {
        "program": "Jason Morgan",
        "category": "Teaching Program",
        "createdBy": "json@gmail.com",
        "rating":"4.8"
      },
    ];

    return data.map((item) {
      return DataRow(cells: [
        DataCell(Row(
          children: [
            Text(item["program"]!, style: plusRegular.copyWith(
                fontWeight: FontWeight.w400, color: Theme
                .of(context)
                .cardColor, fontSize: Dimensions.fontSizeDefault(context))),
            const SizedBox(width: 60)
          ],
        ),),
        DataCell(Row(
          children: [
            Text(item["category"]!, style: plusRegular.copyWith(
                fontWeight: FontWeight.w400, color: Theme
                .of(context)
                .cardColor, fontSize: Dimensions.fontSizeDefault(context))),
            const SizedBox(width: 35)
          ],
        ),),
        DataCell(Row(
          children: [
            Text(item["createdBy"]!, style: plusRegular.copyWith(
                fontWeight: FontWeight.w400, color: Theme
                .of(context)
                .cardColor, fontSize: Dimensions.fontSizeDefault(context))),
            const SizedBox(width: 25)
          ],
        )),
        DataCell(Row(
          children: [
           const Icon(Icons.star,color: Color(0xffFFBB00),size: 28,),
            const SizedBox(width: 3),
            Text(item["rating"]!, style: plusRegular.copyWith(
                fontWeight: FontWeight.w600, color: Theme
                .of(context)
                .primaryColor, fontSize: Dimensions.fontSizeLarge(context))),
            const SizedBox(width: 30)
          ],
        )),
        DataCell(Row(
          children: [
            Icon(Icons.visibility_outlined, color: Theme
                .of(context)
                .cardColor),
            const SizedBox(width: 70)
          ],
        )),
      ]);
    }).toList();
  }
}