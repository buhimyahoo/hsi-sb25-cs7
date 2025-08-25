import 'package:flutter/material.dart';
import 'package:submission7/widgets/custom_text.dart';
import 'package:submission7/widgets/screen_title.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              SizedBox(height: 32),

              ScreenTitle(
                title: 'Let\'s Login',
                subTitle: 'And notes your idea',
              ),
              SizedBox(height: 32),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRegularText(text: 'Email Address'),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hint: Text('example@mail.com'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        }
                        final emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    CustomRegularText(text: 'Password'),
                    SizedBox(height: 12),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hint: Text('********'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 22, width: 155),
                    SizedBox(height: 40),

                    Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF394675),
                              fixedSize: Size.fromHeight(46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/note_screen');
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),
              Container(
                alignment: Alignment.center,
                height: 52,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: CustomRegularText(
                    text: 'Don\'t have any account? Register here',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
