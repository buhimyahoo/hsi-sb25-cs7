import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission7/widgets/custom_nav_bar.dart';
import 'package:submission7/widgets/custom_text.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNavBar(),
                    SizedBox(height: 24),
                    CustomBigText(text: '💡 New Product Ideas'),
                    SizedBox(height: 16),
                    CustomRegularText(
                      text:
                          'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement.\n\nThere will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on the needs.',
                    ),
                    // Expanded(child: Spacer()),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Last edited on 19.30'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 192,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: Icon(Icons.close),
                                      onTap: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 56,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.done, size: 24),
                                      SizedBox(width: 12),
                                      CustomRegularText(
                                        text: 'Mark as Finished',
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 8),

                                SizedBox(
                                  height: 56,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        CupertinoIcons.trash,
                                        size: 24,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Delete Note',
                                        style: TextStyle(
                                          height: 1.4,
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    color: Color(0xFF394675),
                    child: Icon(
                      Icons.more_horiz,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
