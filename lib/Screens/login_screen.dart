import 'package:auth_section/Controllers/auth_service.dart';
import 'package:auth_section/Screens/Widgets/myformfield.dart';
import 'package:auth_section/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = Get.find<AuthService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Form(
        key: _key,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            //email field
            MyFormField(
                labelText: "Email",
                hintText: "Enter Email",
                controller: emailController,
                obscureText: false,
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                prefixIcon: Icon(Icons.email)),
            SizedBox(
              height: 15,
            ),

            //password field
            MyFormField(
                labelText: "Password",
                hintText: "Enter Password",
                controller: passwordController,
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.visibility_off)),
                prefixIcon: Icon(Icons.lock)),
            SizedBox(
              height: 15,
            ),
            //confirm password
            // MyFormField(
            // labelText: "Confirm Password",
            // hintText: "Confirm Password",
            // controller: confirmpasswordController,
            // obscureText: true,
            // suffixIcon:
            //     IconButton(onPressed: () {

            //     }, icon: Icon(Icons.visibility_off)
            //     ),
            // prefixIcon: Icon(Icons.lock)
            // ),
            //outlined button
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    _authService.login(
                    emailController.text, 
                    passwordController.text
                    );
                  }
                },
                child: Text("Sign in")),
          ],
        ),
      ),
    );
  }
}
