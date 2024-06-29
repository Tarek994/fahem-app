import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/presentation/screens/authentication/screens/login_with_phone_screen.dart';
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
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.overlay),
              image: AssetImage('assets/icons/fahemlogo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
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
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'enter your username',
                            labelStyle: TextStyle(color: Colors.black54),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Password',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black54),
                            border: OutlineInputBorder(),
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
                            Text('Remember me', style: TextStyle(color: Colors.white)),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                // Add forgot password functionality
                              },
                              child: Text('Forgot Password?', style: TextStyle(color: Colors.lightBlue)),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add login functionality
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0x5977A6FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: Text('Or continue with:', style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildCircularButton(Icons.phone, 'Phone',(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhoneScreen(),));
                            }),
                            _buildCircularButton(Icons.email, 'Email',(){}),
                            _buildCircularButton(Icons.more_horiz, 'Other',(){}),
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
      children: [
        ElevatedButton(
          onPressed: onPressed,  // Direct assignment, not a function call
          child: Icon(icon, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Color(0x5977A6FF),
            padding: EdgeInsets.all(20),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}