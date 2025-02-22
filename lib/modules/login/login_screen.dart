import 'package:agre_lens_app/models/shared%20prefs/shared_prefs_helper.dart';
import 'package:agre_lens_app/modules/home/home_screen.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    bool? isLoggedIn = await SharedPrefsHelper.getBool('isLoggedIn');
    if (isLoggedIn == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  Future<void> _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "test@example.com" && password == "123456") {
      await SharedPrefsHelper.saveBool('isLoggedIn', true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid email or password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/login_bg.jpg',
                    width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 100,
                  left: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png', width: 80),
                      Text("Agri Lens",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("Your Green Guardian, Every Hour",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Text("Login",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixText: "Forgot?",
                      suffixStyle: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child:
                        Text("Log In", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  Text("Or continue with"),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata, color: Colors.red),
                    label: Text("Google"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
