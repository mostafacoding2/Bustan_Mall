import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/core/utils/validation_account.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/controller/applyshop_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Home/presentation/screens/bottom_nav_screen.dart';
import '../../../Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
class CreateApplyShopBody extends StatelessWidget {
  const CreateApplyShopBody({super.key, required this.businessPhoneController, required this.emailController, required this.businessNameController, required this.theDoorNameController, required this.countryController, required this.nationalIdController, required this.fromkey});
  final TextEditingController businessPhoneController;
  final  TextEditingController emailController;
  final TextEditingController businessNameController;
  final TextEditingController theDoorNameController;
  final TextEditingController countryController;
  final  TextEditingController nationalIdController;
  final GlobalKey<FormState>fromkey;
  @override
  Widget build(BuildContext context) {
    return    ListView(
      children: [
        CustomAppBarTitleArrow(arrow_back: true,onpressed:(){navigateTo(context, BottomNavScreen(currentIndex: 3,));},
          title: "Apply Shop ",
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 18.0.r,
              left: 18.0.r,
              right: 18.0.r,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter BusinessPhone ";
                    } else {
                      return null;
                    }
                  },
                  controller:businessPhoneController ,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  label: "BusinessPhone",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextFormField(
                  validator: (value) => FormValidators.validateField(
                      emailController.text, "Email"),
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "Email",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter BusinessName ";
                    } else {
                      return null;
                    }
                  },
                  controller:businessNameController ,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "BusinessName",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter TheDoorName ";
                    } else {
                      return null;
                    }
                  },
                  controller: theDoorNameController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "TheDoorName",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter Country ";
                    } else {
                      return null;
                    }
                  },
                  controller: countryController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "Country",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter National Id ";
                    } else {
                      return null;
                    }
                  },
                  controller: nationalIdController,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "National Id",
                ),
                SizedBox(
                  height: 12.h,
                ),
                BlocBuilder<ApplyshopCubit, ApplyShopState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        ApplyshopCubit.get(context)
                            .imagepicker==null?  Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                            ),GestureDetector(
                              onTap:(){
                                ImagePicker()
                                    .pickImage(source: ImageSource.camera)
                                    .then((value) => ApplyshopCubit.get(context).pickImage(value!));},
                              child: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.myNavy,
                                      borderRadius: BorderRadius.circular(360.r)),
                                  child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.camera,
                                        color: AppColors.myWhite,
                                      ))),
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) => ApplyshopCubit.get(context).pickImage(value!));

                              },
                              child: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.myNavy,
                                      borderRadius: BorderRadius.circular(360.r)),
                                  child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.photoFilm,
                                        color: AppColors.myWhite,
                                      ))),
                            ),],):SizedBox(),
                        SizedBox(
                          width: 60.w,
                        ),
                        SizedBox(child:
                        ApplyshopCubit.get(context)
                            .imagepicker==null?
                        SizedBox():
                        ClipRRect(borderRadius: BorderRadius.circular(16),
                          child: Image.file(fit: BoxFit.fill, height: 150.h,
                              width: 150.w,File(ApplyshopCubit.get(context)
                                  .imagepicker!
                                  .path)),
                        ))
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                BlocConsumer<ApplyshopCubit, ApplyShopState>(
                  listener: (context, state) {
                    if(state is ApplyShopSuccessState){
                      flutterToast(message: "Success Applyshop  An email will be sent if the request is accepted by the store", success: true);

                  navigateTo(context, BottomNavScreen(currentIndex: 3,));  }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomButton(
                        onTap: () {
                          if(fromkey.currentState!.validate()){
                            if(ApplyshopCubit.get(context).imagepicker==null){
                              flutterToast(message: "please pick the image ", success: false);
                            }
                            else{
                              ApplyshopCubit.get(context).postApplyShop(
                                  businessPhone: businessPhoneController.text,
                                  email: emailController.text,
                                  businessName: businessNameController.text,
                                  theDoorName: theDoorNameController.text,
                                  country: countryController.text,
                                  nationalId: nationalIdController.text
                              );
                            }
                          }
                        },title: "Apply Shop",isLoading: state is ApplyShopLoadingState?true:false,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
