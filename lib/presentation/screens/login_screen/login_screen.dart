import 'package:e_commerce/business/login/login_cubit.dart';
import 'package:e_commerce/data/authentication/models/login_model/user_login_model.dart';
import 'package:e_commerce/remote/cashe_helper/cashe_helper.dart';
import 'package:e_commerce/utils/components.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget getToastMessage() {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.userData.status!) {
            Fluttertoast.showToast(
                msg: state.userData.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            CacheHelper.saveData(
                key: 'token', value: state.userData.data!.token);
            Navigator.pushNamedAndRemoveUntil(context, homeLayoutScreen, (route) => false);
          } else {
            Fluttertoast.showToast(
                msg: state.userData.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var cubit = LoginCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .03),
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .02, vertical: height * .04),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Welcome,',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'sign in to Continue',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff929292),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signupScreen);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff00c569),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .1,
                    ),
                    textWithTextForm(
                      label: "Email",
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    textWithTextForm(
                      label: "Password",
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'password is too short';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: passwordController,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userLogin(UserLoginData(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                          debugPrint("Login");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00c569),
                          minimumSize: Size(double.infinity, height * .08)),
                      child: const Center(
                        child: Text('SIGN IN'),
                      ),
                    ),
                    getToastMessage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
