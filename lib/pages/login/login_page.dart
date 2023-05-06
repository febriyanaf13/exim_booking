import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/utils/extension_image.dart';

import '../../components/rounded_button.dart';
import '../../controllers/loginC.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> globalKeyLogin = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String get username => _usernameController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(kPagePadding),
          decoration: BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.27,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    image: DecorationImage(image: AssetImage('bg_splash'.png))),
              ),
              SizedBox(
                height: 100,
                width: Get.width * 0.8,
                child: Padding(
                  padding: EdgeInsets.all(kElementPadding),
                  child: Image.asset("kece_logo2".png),
                ),
              ),

              Text(
                'Login To Ketech Booking',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: kAccentColor),
              ),
              SizedBox(
                height: kContainerPadding,
              ),
              Form(
                key: globalKeyLogin,
                child: Column(
                  children: [
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText2,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                      controller: _usernameController,
                      // validator: (value) => loginC.validateUsername(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: kContainerPadding),
                    Obx(() => TextFormField(
                          style: Theme.of(context).textTheme.bodyText2,
                          obscureText: controller.obscureText.value,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: kPrimaryColor),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    controller.obscureText.toggle(),
                                icon: Icon(controller.obscureText.isTrue
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                              )),
                          controller: _passwordController,
                          // validator: (value) =>
                          // loginC.validatePassword(value!),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        )),
                    SizedBox(height: kElementPadding - 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: kErrorColor),
                      ),
                    ),
                    SizedBox(height: kElementPadding - 5),
                    RoundedTextButton(
                      text: "Login",
                      textColor: Colors.white,
                      colorBackground: kPrimaryColor,
                      onPressed: () {
                        controller.fetchLogin(username, password);
                        // Get.toNamed(Routes.dashboard);
                      },
                    ),
                  ],
                ),
              ),
              // CustomRichText(
              //   discription: "Don't already Have an account? ",
              //   text: "Sign Up",
              //   onTap: () {
              //     Get.toNamed(Routes.signup);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
