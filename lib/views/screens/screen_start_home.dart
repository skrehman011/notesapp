import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenStartHome extends StatelessWidget {
  const ScreenStartHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15,  ),
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/Illustration.png')).marginOnly(top: 80, bottom: 10),
              Text(
                "Start Your Journey",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ).marginOnly(bottom: 15),
              Text(
                "Every big step start with small step.\n"
                 "    Notes your first idea and start \n"
                  "                     your journey!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ).marginOnly(bottom: 15),
              Image(image: AssetImage('assets/images/Arrow.png')).marginOnly(top: 15)
            ],
          )
      ),
    );
  }
}
