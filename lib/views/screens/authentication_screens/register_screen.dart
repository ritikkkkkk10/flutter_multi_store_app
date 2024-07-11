
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mac_store_app/controller/auth_controller.dart';
import 'package:mac_store_app/views/screens/authentication_screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
  }

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String fullName;
  late String password;
  bool isLoading = false;

  RegisterUser() async{
    setState(() {
      isLoading = true;
    });
    await _authController
    .signUpUsers(context: context,email: email,fullName: fullName,password: password)
    .whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
        0.95,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Create Your Account",
                  style: TextStyle(
                    color: Color(0xFF0d120E),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                    fontSize: 23,
                  ),
                  ),
                  const Text(
                    'To Explore the world exclusives', 
                    style: TextStyle(
                      color: Color(0xFF0d120E),
                      fontSize: 14,
                      letterSpacing: 0.2,
                    )
                    ),
                    Image.asset(
                      'assets/images/Illustration.png',
                      width: 200,
                      height: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
              
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                          color: Color(0xFF0d120E),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      
                      TextFormField(
                        onChanged: (value) {
                          fullName = value;
                        },
                        validator: (value){
                          if(value!.isEmpty) {
                            return "enter your full name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9),
                          ),
                      
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your full name',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/icons/user.jpeg',
                            width: 10,
                            height: 10,
                            ),
                          )
                        ),
                      ),
              
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                          color: Color(0xFF0d120E),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter your email';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9),
                          ),
                      
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your email',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/icons/email.png',
                            width: 10,
                            height: 10,
                            ),
                          )
                        ),
                      ),
                      
                      
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value){
                          if(value!.isEmpty) {
                            return "enter your password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9),
                          ),
                      
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter your password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/icons/password.png',
                            width: 10,
                            height: 10,
                            ),
                          ),
                      
                          suffixIcon: Icon(Icons.visibility),
                        ),
                      ),
              
                      SizedBox(height: 20,),
              
                      InkWell(
                        onTap: () async{
                          if(_formkey.currentState!.validate()) {
                            RegisterUser();
                          }
                        },
                        child: Container(
                          width: 319,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient:const LinearGradient(
                              colors: [
                                Color(0xFF102DE1), 
                                Color(0xCC0D6EFF,)
                                ,],
                                ),
                          ),
                          child: Center(
                            child:isLoading
                            ?const CircularProgressIndicator(
                              color: Colors.white,
                              )
                              :const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize:17, 
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                ),
                              ),
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an Account?', 
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),), 
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return  LoginScreen();
                              }));
                            },
                            child: Text(
                              'Sign in', 
                              style: GoogleFonts.roboto(
                                color:const Color(0xFF103DE5),
                                fontWeight: FontWeight.bold),
                            ),
                          )],
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}