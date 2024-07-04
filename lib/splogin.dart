import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/core/resources/fonts_manager.dart';
import 'package:fahem/presentation/screens/authentication/screens/login_with_phone_screen.dart';
import 'package:fahem/presentation/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';

import 'core/resources/routes_manager.dart';
import 'core/utilities/methods.dart';

class loginReg extends StatefulWidget {
  const loginReg({Key? key}) : super(key: key);

  @override
  State<loginReg> createState() => _LoginRegState();
}

class _LoginRegState extends State<loginReg> {
  bool _rememberMe = false;
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.veryDarkBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fahemlogoWhite.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => MenuScreen()));
            },
            icon: Image(
              image: AssetImage('assets/images/leadingwhite.png'),
              height: 25,
              width: 25,
              fit: BoxFit.fill,
            )
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 27),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        Text(
                          'Username',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: FontFamilyManager.Monthe
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'enter your username',
                            labelStyle: TextStyle(color: Colors.black54, fontFamily: FontFamilyManager.Monthe),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: FontFamilyManager.Monthe
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black54, fontFamily: FontFamilyManager.Monthe),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.lightBlue,
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                                'Remember me',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontFamilyManager.Monthe
                                )
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                // Add forgot password functionality
                              },
                              child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: FontFamilyManager.Monthe
                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity-27,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add login functionality
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: FontFamilyManager.Monthe
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xf45978a7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 46),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 7),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Or',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.5,
                                      fontFamily: FontFamilyManager.Monthe
                                  ),
                                ),
                              ),
                              SizedBox(width: 7),
                              Container(
                                height: 1,
                                width: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 46),
                        Center(
                          child: Text(
                              'continue with',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: FontFamilyManager.Monthe
                              )
                          ),
                        ),
                        SizedBox(height: 19),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildCircularButton(Icons.phone, 'Phone', () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhoneScreen()));
                            }),
                            SizedBox(width: 18),
                            _buildCircularButton(Icons.email, 'Email', () {}),
                            SizedBox(width: 18),
                            _buildCircularButton(Icons.more_horiz, 'Other', () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Icon(icon, color: Colors.white, size: 22),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Color(0xf45978a7),
            padding: EdgeInsets.all(6),
            minimumSize: Size(50, 50),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: FontFamilyManager.Monthe
          ),
        ),
      ],
    );
  }
}