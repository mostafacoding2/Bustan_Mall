import 'dart:io';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/category/data/cubit/category_cubit.dart';
import 'package:ultra_shop/features/category/presentation/screens/Categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
class UpdateCategoryBody extends StatefulWidget {
  const UpdateCategoryBody({super.key, required this.id, required this.name, required this.description, required this.totalProducts, required this.nameCategoryController, required this.descriptionController, required this.TotalProductsController, required this.fromkey});
  final int id;
  final  String name;
  final String description;
  final int totalProducts;
  final TextEditingController nameCategoryController;
  final TextEditingController descriptionController;
  final  TextEditingController TotalProductsController;
  final GlobalKey<FormState>fromkey;

  @override
  State<UpdateCategoryBody> createState() => _UpdateCategoryBodyState();
}
class _UpdateCategoryBodyState extends State<UpdateCategoryBody> {
  bool selectedChoice = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          CustomAppBarTitleArrow(arrow_back: true,
              onpressed: () {
                Navigator.pop(context);
              },
              title: "Update Category"),
          Padding(
            padding: EdgeInsets.only(
                top: 18.0.r,
                left: 18.0.r,
                right: 18.0.r,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                Container(

                  padding:
                  EdgeInsets.only(top: 10.h, bottom: 10.h, left: 8.w, right: 8.w),
                  margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.myWhite,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(191, 214, 215, 1),
                            offset: Offset(1, 4),
                            spreadRadius: 0,
                            blurRadius: 1)
                      ]),
                  child: Row(

                    children:[
                      Text("deleted:  ",style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myDark,
                      ),),
                      Text("$selectedChoice",style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myOrange,
                      ),),SizedBox(width: 10.w,),
                      Radio(
                        value: true,activeColor: AppColors.myGreen,
                        groupValue: selectedChoice,
                        onChanged: (value) {
                          setState(() {
                            selectedChoice = value!;
                          });
                        },
                      ),
                      Text("True",style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myNavy,
                      ),),
                      SizedBox(width: 20),
                      Radio(activeColor: AppColors.myRed,
                        value: false,
                        groupValue: selectedChoice,
                        onChanged: (value) {
                          setState(() {
                            selectedChoice = value!;
                          });
                        },
                      ),
                      Text("False",style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myRed,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 30.h,),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter NameCategory ";
                    } else {
                      return null;
                    }
                  },
                  controller:widget.nameCategoryController ,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "NameCategory",
                ),
                SizedBox(height: 30.h,),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter Description ";
                    } else {
                      return null;
                    }
                  },
                  controller:widget.descriptionController ,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "Description",
                ),SizedBox(height: 30.h,),

                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter TotalProducts ";
                    } else {
                      return null;
                    }
                  },
                  controller:widget.TotalProductsController ,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  label: "TotalProducts",
                ),
                SizedBox(height: 40.h,),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        CategoryCubit.get(context)
                            .imagepicker==null?  Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                            ),GestureDetector(
                              onTap:(){
                                ImagePicker()
                                    .pickImage(source: ImageSource.camera)
                                    .then((value) => CategoryCubit.get(context).pickImage(value!));},
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
                                    .then((value) => CategoryCubit.get(context).pickImage(value!));

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
                        CategoryCubit.get(context)
                            .imagepicker==null?
                        SizedBox():
                        ClipRRect(borderRadius: BorderRadius.circular(16),
                          child: Image.file(fit: BoxFit.fill, height: 150.h,
                              width: 150.w,File(CategoryCubit.get(context)
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
                BlocConsumer<CategoryCubit, CategoryState>(
                  listener: (context, state) {
                    if(state is UpdateCagetorySuccessState){
                      flutterToast(message: "Success", success: true);
                      navigateTo(context, CategoriesScreen());
                    }
                    if(state is UpdateCagetoryErrorState){
                      flutterToast(message: state.errorMessage, success: false);
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () {
                        int priceProd = int
                            .tryParse(
                            widget.TotalProductsController
                                .text) ?? 0;
                        if(widget.fromkey.currentState!.validate()){
                          if(CategoryCubit.get(context).imagepicker==null){
                            flutterToast(message: "please pick the image ", success: false);
                          }
                          else{
                            CategoryCubit.get(context).updateCagetory(
                                id:widget.id,
                                isDeleted: selectedChoice
                                , name: widget.nameCategoryController.text,
                                description: widget.descriptionController.text,
                                totalProducts:priceProd
                            );
                          }
                        }
                      },title: "update Category",
                      isLoading: state is UpdateCagetoryLoadingState?true:false,

                    );
                  },
                )],
            ),
          )
        ]
    );
  }
}
