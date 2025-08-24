import 'package:flutter/material.dart';

class HomeNoNotes extends StatelessWidget {
  const HomeNoNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/notes_logo.png',
                height: 219,
                width: 245,
              ),
              SizedBox(height: 31),
              Text(
                'Start Your Journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                  color: Color(0xFF180E25),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Every big step start with small step.\n Notes your first idea and start\n your journey!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.4,
                  color: Color(0xFF827D89),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 31),
              Image.asset(
                height: 123,
                width: 169,
                'assets/images/curved_arrow.png',
              ),
            ],
          ),
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
