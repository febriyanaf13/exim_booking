
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/utils/extension_image.dart';

import '../../components/custom_header.dart';
import '../../components/custom_richtext.dart';
import '../../components/rounded_button.dart';
import '../../controllers/loginC.dart';
import '../../style/borders.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';

class SignupPage extends GetView<LoginController> {
  SignupPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> globalKeyLogin = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String get username => _usernameController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: kPrimaryColor,
          ),
          CustomHeader(
            text: 'Sign Up',
            onTap: () {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) =>  SignUp()));
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              padding:  EdgeInsets.all(kPagePadding),
              height: Get.height * 0.9,
              width: Get.width,
              decoration:  BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kPageBorder),
                      topRight: Radius.circular(kPageBorder))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: Get.width * 0.8,
                    child: Padding(
                      padding:  EdgeInsets.all(kElementPadding),
                      child: Image.asset("kece_logo2".png),
                    ),
                  ),
                   SizedBox(
                    height: kMenuPadding,
                  ),
                  Form(
                    key: globalKeyLogin,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle:
                                  Theme.of(context).textTheme.bodyText2),
                          controller: _usernameController,
                          // validator: (value) => loginC.validateUsername(value!),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                        ),
                         SizedBox(height: kContainerPadding),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle:
                                  Theme.of(context).textTheme.bodyText2),
                          controller: _usernameController,
                          // validator: (value) => loginC.validateUsername(value!),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                        ),
                         SizedBox(height: kContainerPadding),
                        TextFormField(
                          // obscureText: formC.hidden.value,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon:  Icon(Icons.visibility_outlined),
                              )),
                          // controller: formC.passwordC,
                          // validator: (value) =>
                          // loginC.validatePassword(value!),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                         SizedBox(height: kElementPadding - 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context).textTheme.bodyText1
                                ?.copyWith(color: kErrorColor),
                          ),
                        ),
                         SizedBox(height: kElementPadding - 5),
                        RoundedTextButton(
                          text: "Login",
                          textColor: Colors.white,
                          colorBackground: kPrimaryColor,
                          onPressed: () {
                            // loginC.getLogin(
                            //     formC.usernameC.text, formC.passwordC.text);
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomRichText(
                    discription: "I'am already Have an account? ",
                    text: "Login",
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>  SignUp()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
