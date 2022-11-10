import 'package:e_commerce/data/authentication/models/user_data/user_data.dart';
import 'package:e_commerce/remote/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/authentication/models/login_model/user_login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  late UserData userData;

  void userLogin(UserLoginData userLoginData){
    emit(LoginLoadingState());
    DioHelper.postData(url: 'login',data: {
      'email':userLoginData.email,
      'password' : userLoginData.password,
    }).then((userDataFromApi) {
      userData = UserData.fromJson(userDataFromApi.data);
      emit(LoginSuccessState(userData));
    }).catchError((error){
      debugPrint(error.toString());
      emit(LoginFailState());
    });
  }
}
