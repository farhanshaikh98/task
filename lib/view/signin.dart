import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlogin/view/signup.dart';
import '../components/reusable_button.dart';
import '../components/reusable_textformfield.dart';
import '../controllers/signin_controller.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final _loginKey = GlobalKey<FormState>();

  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/backarrow.png",
                    height: 70,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    // width: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "quis nostrud exercitation ullamco laboris nisi ut",
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 120, 120, 120)),
                ),
                SizedBox(
                  height: 20,
                ),
                ReusableTextFormField(
                    onchange: (v) => signInController.validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: signInController.usernameController,
                    obscureText: false,
                    hintext: "Email Address",
                    suffixIcon: Icon(
                      Icons.mail,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => signInController.validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: signInController.passwordController,
                    obscureText: false,
                    hintext: "Password",
                    suffixIcon: Icon(
                      Icons.lock,
                      size: 20,
                    )),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 75, 117)),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => ReusableButton(
                    buttonColor: signInController.btnActivationStatus.value
                        ? Colors.green
                        : const Color(0xFFAEAEAE),
                    buttonName: "Login",
                    onPressed: () {
                      if (signInController.btnActivationStatus.value) {
                        signInController.loginHandle();
                      }
                    },
                  ),
                ),
                SizedBox(height: 25),
                Text("OR"),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/googleicon.png",
                      height: 74,
                      width: 75,
                    ),
                    Image.asset(
                      "assets/images/fb.png",
                      height: 74,
                      width: 75,
                    ),
                    Image.asset(
                      "assets/images/twitterricon.png",
                      height: 74,
                      width: 75,
                    ),
                    Image.asset(
                      "assets/images/appleicon.png",
                      height: 74,
                      width: 75,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Get.to(SignUp());
                  },
                  child: Text(
                    "Dont't have an account ? Sign Up",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 79, 75, 75)),
                  ),
                ),
                SizedBox(height: 35),
              ],
            ),
          )),
    ));
  }
}
