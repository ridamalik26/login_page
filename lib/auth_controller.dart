import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/screens/login_page.dart';
import 'package:login_firebase/screens/welcome_page.dart';

class AuthController extends GetxController {
  // AuthController.instance..
  static AuthController instance = Get.find();
  // email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      print("login page");
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(() => WelcomePage(email: user.email!));
      ever(_user, _initialScreen);
    }
  }

  Future<void> register(String email, password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User Message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white
          ),
      ),
        messageText: Text(
          e.toString()
        )
      );
    }
  }
  Future<void> login(String email, password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login Message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString()
          )
      );
    }
  }
  Future<void> logOut() async {
    await auth.signOut();
  }
}
