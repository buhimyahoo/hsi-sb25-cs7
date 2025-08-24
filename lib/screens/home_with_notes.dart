import 'package:flutter/material.dart';
// import 'package:submission7/widgets/custom_text.dart';

class HomeWithNotes extends StatelessWidget {
  const HomeWithNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 20,
          //       mainAxisSpacing: 16,
          //       childAspectRatio: .5,
          //     ),
          //     itemCount: dummyData.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(12),
          //         child: Column(
          //           mainAxisSize: MainAxisSize.max,
          //           children: [
          //             CustomBigText(text: dummyData[index]['title']!),
          //             SizedBox(height: 16),
          //             CustomSmallText(text: dummyData[index]['note']!),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF394675),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
            elevation: 0,
            child: Icon(Icons.add, size: 32),
          ),
        ),
      ),
    );
  }
}
