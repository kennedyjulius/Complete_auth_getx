import 'package:auth_section/Controllers/auth_service.dart';
import 'package:auth_section/Screens/login_screen.dart';
import 'package:auth_section/Screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAvGDCkwzSSBhiPA3t5VXS4a2yGCjmc6G4",
          appId: "1:35728383296:android:ff9ec31c3d4aa834106ea5",
          messagingSenderId: "35728383296",
          projectId: "authenticatiosocial"));
  runApp(const MyApp());
  Get.put(AuthService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthService());
      }),
      title: 'Flutter',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
