import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/screens/forget_password_screen.dart';
import 'package:ultra_shop/features/Account/presentation/screens/register_screen.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/curvy_appbar.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_navigationtext.dart';
import 'package:ultra_shop/core/utils/validation_account.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/Account/presentation/screens/select_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../payment/data/repos/checkout_repo_impl.dart';
import '../../../payment/presentation/manger/cubit/create_customer_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCustomerCubit(CheckoutRepoImpl()),
      child: BlocBuilder<CreateCustomerCubit, CreateCustomerState>(
        builder: (context, state) {
          var Data = CreateCustomerCubit.get(context);
          return Column(
            children: [
              const CurvyAppBar(
                title: AppString.login,
              ),
              SizedBox(height: 180.h),
              Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Column(
                  children: [
                    CustomTextFormField(
                        keyboardType: TextInputType.text,
                        widget: const Icon(Icons.person),
                        controller: widget.usernameController,
                        label: AppString.username,
                        obscureText: false,
                        validator: (value) => FormValidators.validateField(
                            widget.usernameController.text,
                            AppString.username)),
                    SizedBox(height: 20.h),
                    BlocBuilder<AccountCubit, AccountState>(
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
                            controller: widget.passwordController,
                            label: AppString.password,
                            obscureText: cubit.isPassword,
                            validator: FormValidators.validatePassword);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.w,
              ),
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 13.w,
                            height: 13.h,
                            child: Checkbox(
                                activeColor: AppColors.myBlue,
                                splashRadius: 0,
                                value: AccountCubit.get(context).value,
                                tristate: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                side: BorderSide(
                                    color: AppColors.myDark,
                                    width: 1,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignInside),
                                onChanged: (value) {
                                  AccountCubit.get(context)
                                      .saveCreditInformation();
                                }

                                // activeColor:
                                ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: 30.0.w),
                            child: InkWell(
                              radius: 0,
                              onTap: () {
                                AccountCubit.get(context)
                                    .saveCreditInformation();
                                setState(() {});
                              },
                              child: Text(
                                AppString.rememberMe,
                                style: lightTheme.textTheme.labelMedium!.apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.myDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      NavigationText(
                        text: AppString.forgotPassword,
                        onTap: () {
                          if (AccountCubit.get(context).value == true) {
                            navigateAndReplacement(
                                context, const ForgotPasswordScreen());
                          } else {
                            flutterToast(
                                message: "you have to choose", success: false);
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 80.h),
              BlocProvider(
                create: (context) => AccountCubit(),
                child: BlocConsumer<AccountCubit, AccountState>(
                  listener: (context, state) {
                    if (state is LoginErrorState) {
                      flutterToast(
                          message: "Make sure the data is correct",
                          success: false);
                    }
                    if (state is LoginFailureState) {
                      flutterToast(message: state.failure, success: false);
                    }
                    if (state is LoginSuccessState) {
                      print(state.loginModel.roles);
                      PreferenceUtils.setString(SharedKeys.userName,widget.usernameController.text );
                      userName = widget.usernameController.text;
                      flutterToast(
                          message: "You have successfully logged in",
                          success: true);
                      Data.createCustomer(name: widget.usernameController.text);
                      if (state.loginModel.roles!.length == 1) {
                        PreferenceUtils.setString(SharedKeys.role, "User");
                        role = "User";
                      }
                      final Widget widgetScreen;
                      (state.loginModel.roles!.length == 1)
                          ? widgetScreen = BottomNavScreen(
                              currentIndex: 0,
                            )
                          : widgetScreen = SelectRole(
                              roles: state.loginModel.roles,
                            );
                      navigateAndReplacement(context, widgetScreen);
                      // navigateTo(context, const HomeScreen());
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var cubit = AccountCubit.get(context);
                    return CustomButton(
                        isLoading: state is LoginLoadingState ? true : false,
                        title: AppString.login,
                        onTap: () {
                          if (widget.formKey.currentState!.validate()) {
                            cubit.login(
                                userName: widget.usernameController.text,
                                password: widget.passwordController.text);
                          }
                        });
                  },
                ),
              ),
              SizedBox(height: 60.h),
              Center(
                  child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "Don’t have an account?",
                    style: lightTheme.textTheme.labelSmall!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.myDark,
                    ),
                  ),
                  const Spacer(),
                  NavigationText(
                    onTap: () {
                      navigateAndRemove(context, const RegisterScreen());
                    },
                    text: AppString.createAncount,
                  ),
                  const Spacer(),
                ],
              )),
            ],
          );
        },
      ),
    );
  }
}
