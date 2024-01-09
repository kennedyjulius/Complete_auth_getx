import 'package:auth_section/Utils/myformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final RxBool isObscurePassword = true.obs;
  final RxBool isObsecureConfirmPassword = true.obs;
  final RxBool isObsecureEmail ;

  SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            Text("Welcome"),
            SizedBox(height: 20),
            // email field
            MyFormField(
              hintText: "Enter your Email Address",
              LabelText: "Email",
              prefixIcon: Icon(Icons.email_outlined),
              suffixIcon: IconButton(
                onPressed: () {
                  emailController.clear();
                },
                icon: Icon(Icons.clear_all_outlined),
              ),
              controller: emailController,
              obscure: isObsecureEmail,
            ),
            SizedBox(height: 20),
            // password field
            MyFormField(
              hintText: "Enter your Password",
              LabelText: "Password",
              prefixIcon: Icon(Icons.lock_clock_outlined),
              suffixIcon: Obx(() => IconButton(
                    onPressed: () {
                      isObscurePassword.toggle();
                    },
                    icon: Icon(
                      isObscurePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )),
              controller: PasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              obscure: isObscurePassword,
            ),
            SizedBox(height: 20),

            // Confirm password
            MyFormField(
              hintText: "Confirm your Password",
              LabelText: "Confirm Password",
              prefixIcon: Icon(Icons.lock_clock_outlined),
              suffixIcon: Obx(() => IconButton(
                    onPressed: () {
                      isObsecureConfirmPassword.toggle();
                    },
                    icon: Icon(
                      isObsecureConfirmPassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )),
              controller: ConfirmPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please confirm your password";
                } else if (value != PasswordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
              obscure: isObsecureConfirmPassword,
            ),
            SizedBox(height: 20),
            // button
            OutlinedButton(
              onPressed: () {
                if (_key.currentState?.validate() ?? false) {
                  // Your logic for handling valid form submission
                }
              },
              child: Text("Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}
