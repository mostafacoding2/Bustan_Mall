part of 'account_cubit.dart';
@immutable
abstract class AccountState {}
 class AccountInitial extends AccountState {}
class ChangePasswordState  extends AccountState {}
class SaveCreditDataState  extends AccountState {}
//ToDo register
class RegisterLoadingState extends AccountState {}
class RegisterSuccessState extends AccountState {
 final RegisterModel registerModel;
 RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends AccountState {
 final FailureRegisterModel failureRegisterModel;RegisterErrorState(this.failureRegisterModel);}
class RegisterFailureState extends AccountState {final dynamic failure;
 RegisterFailureState(this.failure);}
//ToDo login
class LoginLoadingState extends AccountState {}
class LoginSuccessState extends AccountState {
 final LoginModel loginModel;
LoginSuccessState(this.loginModel);
}
class LoginErrorState extends AccountState {
 final dynamic errormessage;
 LoginErrorState(this.errormessage);
}
class LoginFailureState extends AccountState {
 final String failure;
 LoginFailureState(this.failure);
}
//ToDo ForgetPassword
class ForgetPasswordLoadingState extends AccountState {}
class ForgetPasswordSuccessState extends AccountState {}
class ForgetPasswordErrorState extends AccountState {final String errormessage;ForgetPasswordErrorState(this.errormessage);}
class ForgetPasswordFailureState extends AccountState {
 final String failure;
 ForgetPasswordFailureState(this.failure);
}

//ToDo ChangePassword
class ChangePasswordLoadingState extends AccountState {}
class ChangePasswordSuccessState extends AccountState {}
class ChangePasswordErrorState extends AccountState {
 final String errorMessage;
ChangePasswordErrorState(this.errorMessage);
}
class ChangePasswordFailureState extends AccountState {
 final ChangePasswordModel changePasswordModel;
 ChangePasswordFailureState(this.changePasswordModel);
}


class ShowUserLoadingState extends AccountState {}
class ShowUserSuccessState extends AccountState {}
class ShowUserErrorState extends AccountState {
 final String errormessage;
 ShowUserErrorState(this.errormessage);
}


class AddRoleLoadingState extends AccountState {}
class AddRoleSuccessState extends AccountState {}
class AddRoleErrorState extends AccountState {
 final String errormessage;
 AddRoleErrorState(this.errormessage);
}