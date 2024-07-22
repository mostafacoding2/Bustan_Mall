import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shops_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/update_shop_screen.dart';
class UpdateShopBody extends StatelessWidget {
  const UpdateShopBody({
    super.key,
    required this.formkey,
    required this.NameShopController,
    required this.theDoorNumberController,
    required this.phoneNumberController,
    required this.emailcontroller,
    required this.widget,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController NameShopController;
  final TextEditingController theDoorNumberController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailcontroller;
  final UpdateShopScreen widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            CustomAppBarTitleArrow(arrow_back: true,
              title: "update Shop",
              onpressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    validator: (data) {
                      if (data?.isEmpty ?? true) {
                        return "You Must Selected nameShop ";
                      } else {
                        return null;
                      }
                    },
                    label: "NameShop",
                    controller: NameShopController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must Selected theDoorNumber ";
                        } else {
                          return null;
                        }
                      },
                      label: "theDoorNumber",
                      controller: theDoorNumberController,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must Selected phoneNumber ";
                        } else {
                          return null;
                        }
                      },
                      label: " phoneNumber",
                      controller: phoneNumberController,
                      obscureText: false,
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must Selected email ";
                        } else {
                          return null;
                        }
                      },
                      label: "email",
                      controller: emailcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            BlocConsumer<ShopsCubit, ShopsState>(
              listener: (context, state) {
                if (state is UpdateShopsSuccessState) {
                  flutterToast(
                      message: "update shop success", success: true);
                  navigateAndReplacement(context, ShopsScreen());
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading:
                  state is UpdateShopsLoadingState ? true : false,
                  title: "update shop",
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      ShopsCubit.get(context).updateShop(
                          imagePath: widget.fileImage,
                          id: widget.id!,
                          name: NameShopController.text,
                          theDoorNumber: theDoorNumberController.text,
                          phoneNumber: phoneNumberController.text,
                          email: emailcontroller.text);
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
