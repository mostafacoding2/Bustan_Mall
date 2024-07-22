import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/screens/login_screen.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_navigationtext.dart';
import 'package:ultra_shop/core/utils/validation_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody(
      {super.key,
      required this.formKey,
      required this.userNameController,
      required this.newPasswordController});
  final TextEditingController userNameController;
  final TextEditingController newPasswordController;
  final GlobalKey<FormState> formKey;
  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.h),
        CustomTextFormField(
            keyboardType: TextInputType.text,
            widget: const Icon(Icons.person),
            controller: widget.userNameController,
            label: AppString.username,
            obscureText: false,
            validator: (value) => FormValidators.validateField(
                widget.userNameController.text, AppString.username)),
        SizedBox(height: 40.h),
        BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            var cubit = AccountCubit.get(context);
            return CustomTextFormField(
                keyboardType: TextInputType.text,
                widget: GestureDetector(
                  onTap: () {
                    cubit.changePasswordVisibility();
                    setState(() {});
                  },
                  child: Icon(cubit.icon),
                ),
                controller: widget.newPasswordController,
                label: AppString.newPassword,
                obscureText: cubit.isPassword,
                validator: (value) => FormValidators.validateField(
                    widget.newPasswordController.text, AppString.newPassword));
          },
        ),
        SizedBox(height: 60.h),
//  ToDo edit cubit and status
        BlocProvider(
          create: (context) => AccountCubit(),
          child: BlocConsumer<AccountCubit, AccountState>(
            listener: (context, state) {
              if (state is ForgetPasswordErrorState) {
                flutterToast(message: state.errormessage, success: false);
              }
              if (state is ForgetPasswordFailureState) {
                flutterToast(message: state.failure, success: false);
              }
              if (state is ForgetPasswordSuccessState) {
                flutterToast(message: "success  you can login now ", success: true);
                navigateAndReplacement(context, const LoginScreen());
              } else {
                isLoading = true;
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = AccountCubit.get(context);
              return CustomButton(title:AppString.resetPassword ,
                isLoading: state is ForgetPasswordLoadingState?true:false,

                  onTap: () {
                    if (widget.formKey.currentState!.validate()) {
                      cubit.forgetPassword(
                          userName: widget.userNameController.text,
                          changePass: widget.newPasswordController.text);
                    }
                  });
            },
          ),
        ),
        SizedBox(height: 60.h),
        Row(
          children: [
            const Spacer(),
            Text('Now you can login',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDark,
                ),),
            const Spacer(),
            NavigationText(
                text: AppString.login,
                onTap: () {
                  navigateAndRemove(context, const LoginScreen());
                }),
            const Spacer(),
          ],
        )
      ],
    );
  }
}
