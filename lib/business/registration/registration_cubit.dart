import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/authentication/models/registration_model/registration_model.dart';
import 'package:e_commerce/data/authentication/models/user_data/user_data.dart';
import 'package:e_commerce/remote/cashe_helper/cashe_helper.dart';
import 'package:e_commerce/remote/dio/dio_helper.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(context) => BlocProvider.of(context);

  late UserData userDataa;

  void createNewUser(RegistrationModel registrationModel) {
    emit(RegistrationLoadingState());
    DioHelper.postData(
      url: "register",
      query: {
        "name" : registrationModel.name,
        "phone" : registrationModel.phone,
        "email" : registrationModel.email,
        "password" : registrationModel.password,
      }
    ).then((value) {
      userDataa =  UserData.fromJson(value.data);
      print(userDataa.data?.token);
      emit(RegistrationSuccessState(userDataa));
    }).catchError((error){
      print(error.toString());
      emit(RegistrationFailState());
    });
  }
}
