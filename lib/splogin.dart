import 'package:fahem/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
class loginaReg extends StatefulWidget {
  const loginaReg({super.key});

  @override
  State<loginaReg> createState() => _loginaRegState();
}

class _loginaRegState extends State<loginaReg> {
  @override
  Widget build(BuildContext context) {
    bool _rememberMe=false;
    return Scaffold(
      backgroundColor: ColorsManager.veryDarkBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title:Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/icons/fahemlogo.png'
                  ),
                  fit: BoxFit.cover
              )
          ),
        ),
        leading: IconButton(
            onPressed: (){}, icon: Icon(Icons.menu,
        color: Colors.white,
        )
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (){}, icon: Icon(Icons.search,
              color: Colors.white,
              )
              ),
            ],
          ),

        ],
      ),
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Username',
                style: TextStyle(color: Colors.white),
              ),
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
                style: TextStyle(color: Colors.white),
              ),
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
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.blue;
                          }
                          return Colors.white;
                        },
                      ),
                    ),
                  ),
                  Text('Remember me', style: TextStyle(color: Colors.white)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Add forgot password functionality
                    },
                    child: Text('Forgot Password?', style: TextStyle(color: Colors.white)),
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
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Or continue with:', style: TextStyle(color: Colors.white)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircularButton(Icons.phone, 'Phone'),
                  _buildCircularButton(Icons.email, 'Email'),
                  _buildCircularButton(Icons.more_horiz, 'Other'),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
  Widget _buildCircularButton(IconData icon, String label) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Add functionality
          },
          child: Icon(icon, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(), backgroundColor: Colors.blue,
            padding: EdgeInsets.all(20),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

