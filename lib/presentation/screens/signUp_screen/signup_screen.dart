import 'package:e_commerce/business/registration/registration_cubit.dart';
import 'package:e_commerce/data/authentication/models/registration_model/registration_model.dart';
import 'package:e_commerce/remote/cashe_helper/cashe_helper.dart';
import 'package:e_commerce/utils/components.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget getToastMessage() {
    return BlocListener<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationSuccessState) {
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
          }
          else {
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
      child:const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cubit = RegistrationCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .03),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .02, vertical: height * .02),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        textWithTextForm(
                          label: "Name",
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if(value.isEmpty){
                              return 'name must not be empty';
                            }
                            return null;
                          },
                          controller: nameController,
                        ),
                        SizedBox(
                          height: height * .04,
                        ),
                        textWithTextForm(
                          label: "Phone",
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if(value.isEmpty){
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                          controller: phoneController,
                        ),
                        SizedBox(
                          height: height * .04,
                        ),
                        textWithTextForm(
                          label: "Email",
                          textInputType: TextInputType.emailAddress,
                          validator: ( value) {
                            if(value.isEmpty){
                              return 'email must not be empty';
                            }return null;
                          },
                          controller: emailController,
                        ),
                        SizedBox(
                          height: height * .04,
                        ),
                        textWithTextForm(
                          label: "Password",
                          textInputType: TextInputType.visiblePassword,
                          validator: ( value) {
                            if(value.isEmpty){
                              return 'password is too short';
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: height * .06,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.createNewUser(RegistrationModel(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text));
                              print("success register");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff00c569),
                              minimumSize: Size(double.infinity, height * .08)),
                          child: const Center(
                            child: Text('SIGN UP'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              getToastMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
