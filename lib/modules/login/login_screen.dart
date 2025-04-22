import 'package:agre_lens_app/layout/app_layout.dart';
import 'package:agre_lens_app/shared/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components/components.dart';
import '../home/home_screen.dart';
import 'forget_password_screen.dart';

class LoginPage extends StatefulWidget {
  final String? message;
  const LoginPage({Key? key, this.message}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.message!),
            backgroundColor: ColorManager.greenColor,
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordVisible = false;
  var formkey = GlobalKey<FormState>();
  var scafoldkey = GlobalKey<ScaffoldState>();
  bool isLoading = false;


  Future<void> loginUser(BuildContext context) async {
    if (formkey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true; // عرض مؤشر التحميل
      });

      try {
        // محاولة تسجيل الدخول
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // هنا تم تسجيل الدخول بنجاح
        print("Login successful: ${userCredential.user?.email}");

        // إخفاء مؤشر التحميل والانتقال للصفحة الرئيسية
        setState(() {
          isLoading = false;
        });

        // الانتقال للصفحة الرئيسية بعد التسجيل
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppLayout()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false; // إخفاء مؤشر التحميل في حالة الخطأ
        });

        // التعامل مع الأخطاء
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The email or password is incorrect.')),
          );
        } else {
          // Display the message "The email or password is incorrect" for all other errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The email or password is incorrect.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: scafoldkey,
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/login_bg.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Login_logo.png',
                        height: 180,
                        width: 202,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF414042),
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultFormField(
                        context: context,
                        controller: emailController,
                        labelText: 'Email',
                        type: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null; // متابعه للـ validator الأساسي
                        },
                      ),

                      defaultFormField(
                        context: context,
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        isPassword: !isPasswordVisible,
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            !isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null; // متابعه للـ validator الأساسي
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context)=> ForgetPassword())
                              );
                            },
                            child: Text(
                              'Forgot?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? Center(child: CircularProgressIndicator(color: ColorManager.greenColor,))
                          :  defaultButton(
                                onTap: (){
                                  loginUser(context);
                                },
                                colorButton: ColorManager.greenColor,
                                textColorButton: Colors.white,
                                text: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                            ),
                      SizedBox(height: 25,),
                      Center(
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      defaultButton(
                          onTap: (){},
                          colorButton: Color(0xFFF1F5F9),
                          textColorButton: Color(0xFF475569),
                          text: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/google icon.svg'
                              ),
                              SizedBox(width: 5,),
                              Text(
                              'Google',
                              style: TextStyle(
                                color: Color(0xFF475569),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              )],
                          ),
                      )
                    ],
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


