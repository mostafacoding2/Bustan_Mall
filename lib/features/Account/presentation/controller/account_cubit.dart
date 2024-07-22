import 'dart:developer';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:dio/dio.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra_shop/features/Account/data/models/login_model.dart';
import '../../data/models/change_password_model.dart';
import '../../data/models/failure_register_model.dart';
import '../../data/models/register_model.dart';
import '../../data/models/show_user_model.dart';
part 'account_state.dart';
class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  static AccountCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData icon = Icons.visibility;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    icon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordState());
  }
  bool value = false;
  void saveCreditInformation() {
    value = !value;
    emit(SaveCreditDataState());
  }

  Future login(
      {LoginModel? loginModel,
        required String userName,
        required String password}) async {
    try {
      emit(LoginLoadingState());
      final response = await DioHelper.postData(
          url: ApiConstant.login,
          data: ({"userName": userName, "password": password}));
      loginModel = LoginModel.fromJson(response.data);
      emit(LoginSuccessState(loginModel));
      PreferenceUtils.setString(SharedKeys.token, loginModel.mytoken);
      token = loginModel.mytoken;
      return loginModel;
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['title'] ?? 'oops there was an error try later';
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(LoginErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(LoginFailureState((e.toString())));
    }
  }


  Future<dynamic> register({
    RegisterModel? registerModel,
    required String firstName,
    required String lastName,
    required String userName,
    required String password,
    required String confirmPass,
    required String email,
    required String phone,
    required String street,
    required String city,
    FailureRegisterModel? failureRegisterModel
  }) async {
    try {
      emit(RegisterLoadingState());
      final response = await DioHelper.postData(
          url: ApiConstant.register,
          data: ({
            "firstName": firstName,
            "lastName": lastName,
            "confirmPass": confirmPass,
            "email": email,
            "userName": userName,
            "password": password,
            "phone": phone,
            "street": street,
            "city": city,
          }));
      registerModel= RegisterModel.fromJson(response.data);
      emit(RegisterSuccessState(registerModel));
      PreferenceUtils.setString(SharedKeys.token, registerModel.token!);
      token = registerModel.token!;
      return registerModel;
    } on DioException catch (e) {
      if(e.response?.data is String ){
        print(e);
        emit(RegisterFailureState((e)));
      }
      else{
        print(e.toString());

        failureRegisterModel=FailureRegisterModel.fromJson(e.response?.data);
        emit(RegisterErrorState((failureRegisterModel)));}
    }
  }

  Future<dynamic> forgetPassword({
    required String userName,
    required String changePass,
  }) async {
    try {
      emit(ForgetPasswordLoadingState());
      final formData = FormData.fromMap({
        'UserName': userName,
        'ChangePass': changePass,
      });
      final response = await DioHelper.postData(
          url: ApiConstant.forgetPassword, data: formData);
      emit(ForgetPasswordSuccessState());
      return response.data;
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data ?? 'oops there was an error try later';
      emit(ForgetPasswordErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      emit(ForgetPasswordFailureState((e.toString())));
    }
  }
  void changePassword({
    required String userName,
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
    ChangePasswordModel?changePasswordModel
  }) async {
    try {
      emit(ChangePasswordLoadingState());
      final formData = FormData.fromMap({
        'UserName': userName,
        'OldPassword': oldPassword,
        'NewPassword': newPassword,
        'ConfirmNewPassword': confirmNewPassword
      });
      Response response = await DioHelper.postData(
          token: token, url: ApiConstant.changePassword, data: formData);

      emit(ChangePasswordSuccessState());
      return response.data;
    } on DioException catch(e){
      if(e.response?.data is String)
        emit(ChangePasswordErrorState(e.toString()));
      else{
        changePasswordModel=ChangePasswordModel.fromJson(e.response?.data);
        emit(ChangePasswordFailureState(changePasswordModel));
      }
    }
  }

  ShowUserModel? showUserModel;
  Future showUser() async {
    try {
      emit(ShowUserLoadingState());
      final response = await DioHelper.getData(
        bearerToken: token,
        url: ApiConstant.showUser,
      );
      emit(ShowUserSuccessState());
      showUserModel = ShowUserModel.fromJson(response.data);
      return showUserModel;
    } on DioException catch(error){
      emit(ShowUserErrorState(error.toString()));
    }
  }

  void addRole({required String userName,required String roleName }) async {
    try {
      emit(AddRoleLoadingState());
      final response = await DioHelper.postData( data: ({"userName": userName,
        "roleName": roleName}),
        token: token,
        url: ApiConstant.addRole,
      );
      emit(AddRoleSuccessState());
    }  on DioException catch(error){
      dynamic errors=error.response?.data;
      emit(AddRoleErrorState(errors));
    }
  }
}
