import 'package:flutter/material.dart';
import 'package:login_firebase/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  final String email;

  const WelcomePage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height; // 'h' is not used anymore

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            SizedBox(height: w * 0.3), // Spacing from the top

            Text(
              "Welcome",
              style: TextStyle(
                fontSize: w * 0.08,
                fontWeight: FontWeight.bold,
                // Assuming you want the text to be visible, it should not be 'Colors.white' on a default white scaffold background.
                // Changing to a visible color, e.g., black.
                color: Colors.white,
              ),
            ),

            SizedBox(height: w * 0.4),

            Text(
              email,
              style: TextStyle(
                fontSize: 18,

                color: Colors.white
              ),
            ),

            SizedBox(height: w * 0.4),

            // Sign Out Button
            ElevatedButton(
              onPressed: () {
                AuthController.instance.logOut();
                // print("Sign Out pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: w * 0.04),
                textStyle: TextStyle(fontSize: w * 0.05),
              ),
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}