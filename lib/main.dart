import 'package:flutter/material.dart';
import '../../../view/base/theme_data.dart';
import '../../../view/screen/bottom_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: lightData,
     home:  BottomNavigationBarScreen(pageIndex: 0),
     //home:ResponsiveColumn(),
    );
  }
}



class ResponsiveColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Responsive Layout")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int itemsPerRow = screenWidth > 600 ? 2 : 1; // 2 items per row on tablets, 1 on mobile

            return Wrap(
              spacing: 10, // Space between items horizontally
              runSpacing: 10, // Space between items vertically
              children: List.generate(6, (index) {
                return SizedBox(
                  width: (screenWidth / itemsPerRow) - 15, // Auto-adjust width
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Container ${index + 1}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
