import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';

class SuccesOrder extends StatelessWidget {
  const SuccesOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/bags.png"),
            ),
            SizedBox(height: 20),
            // Centered Text
            const Text("Success", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
           SizedBox(height: 100,),
            Container(
                width: 300,
                child: Text("The order will be ordered soon thank you for choosing this app",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
            Spacer(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton("Continue Shopping", () {
                  Navigator.pushReplacementNamed(context, RouteNames.bottomNavBar);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
