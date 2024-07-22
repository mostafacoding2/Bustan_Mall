import 'package:flutter/material.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/core/utils/validation_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
    required this.userNameController,
    required this.fromkey,
  });
 final TextEditingController oldPasswordController;
final  TextEditingController newPasswordController ;
 final TextEditingController confirmNewPasswordController ;
final  TextEditingController userNameController ;
final  GlobalKey<FormState> fromkey;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [  CustomTextFormField(controller: userNameController,
        validator: (data) {
          if (data?.isEmpty ?? true) {
            return "You Must Enter UserName ";
          } else {
            return null;
          }
        },
        obscureText: false,
        keyboardType: TextInputType.text,
        label: "UserName",
        widget: Icon(Icons.person),
      ),
        SizedBox(
          height: 20.h,
        ),
        BlocProvider(
          create: (context) => AccountCubit(),
          child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                var cubit = AccountCubit.get(context);
                return CustomTextFormField(
                    keyboardType: TextInputType.text,
                    widget: GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(cubit.icon),
                    ),
                    controller: oldPasswordController,
                    label: "OldPassword",
                    obscureText: cubit.isPassword,
                    validator: FormValidators.validatePassword);
              }),
        ),
        SizedBox(
          height: 20.h,
        ),
        BlocProvider(
          create: (context) => AccountCubit(),
          child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                var cubit = AccountCubit.get(context);
                return CustomTextFormField(
                    keyboardType: TextInputType.text,
                    widget: GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(cubit.icon),
                    ),
                    controller: newPasswordController,
                    label: "NewPassword",
                    obscureText: cubit.isPassword,
                    validator: FormValidators.validatePassword);
              }),
        ),
        SizedBox(
          height: 20.h,
        ),
        BlocProvider(
          create: (context) => AccountCubit(),
          child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                var cubit = AccountCubit.get(context);
                return CustomTextFormField(
                    keyboardType: TextInputType.text,
                    widget: GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(cubit.icon),
                    ),
                    controller: confirmNewPasswordController,
                    label: "ConfirmNewPassword",
                    obscureText: cubit.isPassword,
                    validator: FormValidators.validatePassword);
              }),
        ),
        SizedBox(
          height: 40.h,
        ),
        BlocProvider(
          create: (context) => AccountCubit(),
          child: BlocConsumer<AccountCubit, AccountState>(
            listener: (context, state) {
              if (state is ChangePasswordFailureState) {
                flutterToast(message: "Make sure the data is correct", success: false);

              if (state.changePasswordModel.errors!.confirmNewPassword![0].isNotEmpty) {
                  flutterToast(
                      message:
                      state.changePasswordModel.errors!.confirmNewPassword![0],
                      success: false);
                }
                if (state.changePasswordModel.errors!.confirmNewPassword![1].isNotEmpty) {
                  flutterToast(
                      message:
                      state.changePasswordModel.errors!.confirmNewPassword![1],
                      success: false);
                }
                ////////////////////////
                if (state.changePasswordModel.errors!.oldPassword![0].isNotEmpty) {
                  flutterToast(
                      message:
                      state.changePasswordModel.errors!.oldPassword![0],
                      success: false);
                }
                if (state.changePasswordModel.errors!.oldPassword![1].isNotEmpty) {
                  flutterToast(
                      message:
                      state.changePasswordModel.errors!.oldPassword![1],
                      success: false);
                }
                //////////////////
                if (state.changePasswordModel.errors!.newPassword![0].isNotEmpty) {
                  flutterToast(
                      message:
                      state.changePasswordModel.errors!.newPassword![0],
                      success: false);
                }
                if (state.changePasswordModel.errors!.newPassword![1].isNotEmpty) {
                  flutterToast(
                      message:
                      state.changePasswordModel.errors!.newPassword![1],
                      success: false);
                }
              }
              if(state is ChangePasswordErrorState){
                flutterToast(message: state.errorMessage, success: false);
                flutterToast(message: "Make sure the data is correct", success: false);
              }
              if(state is ChangePasswordSuccessState){
                flutterToast(message: "The password has been changed", success: true);
                Navigator.pop(context)  ;              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return CustomButton(title:'Change Password' ,
                  isLoading:state is  ChangePasswordLoadingState?true:false,
                  onTap: () {
                    if (fromkey.currentState!.validate()) {
                      AccountCubit.get(context).changePassword(
                        userName: userNameController.text,
                          oldPassword: oldPasswordController.text,
                          newPassword: newPasswordController.text,
                          confirmNewPassword: confirmNewPasswordController.text)
                      ;
                    }
                  },
              );
            },
          ),
        )],),
    );

  }
}
