import 'dart:io';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/category/data/cubit/category_cubit.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductBody extends StatefulWidget {
   UpdateProductBody(
      {super.key,
      required this.categoryName,
      required this.id,
      required this.nameShop,
      required this.itemName,
      required this.priceProd,
      required this.descrip,
      required this.solditemsProd,
      required this.quantityProd,
      required this.categoryNamecontroller,
      required this.ItemNamecontroller,
      required this.priceProdcontroller,
      required this.Descripcontroller,
      required this.stockProdcontroller,
      required this.solditemsProdcontroller,
      required this.quantityProdcontroller,
      required this.nameShopcontroller,
      required this.formkey});
  final TextEditingController categoryNamecontroller;
  final TextEditingController ItemNamecontroller;
  final TextEditingController priceProdcontroller;
  final TextEditingController Descripcontroller;
  final TextEditingController stockProdcontroller;
  final TextEditingController solditemsProdcontroller;
  final TextEditingController quantityProdcontroller;
  final TextEditingController nameShopcontroller;
  final GlobalKey<FormState> formkey;

  String? categoryName;
  int? id;
  String? nameShop;
  String? itemName;
  int? priceProd;
  String? descrip;
  int? solditemsProd;
  int? quantityProd;
  @override
  State<UpdateProductBody> createState() => _UpdateProductBodyState();
}

class _UpdateProductBodyState extends State<UpdateProductBody> {
  String selectedFieldCount = "Smartwatches";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formkey,
        child: Column(
          children: [
            CustomAppBarTitleArrow(arrow_back: true,
              title: "update product",
              onpressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider(
                    create: (context) => CategoryCubit()..getAllCategories(),
                    child: BlocConsumer<CategoryCubit, CategoryState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        var data = CategoryCubit.get(context).allCategory;
                        return CustomTextFormField(
                          readOnly: true,
                          hintText: widget.categoryName,
                          label: "categoryName",
                          controller: widget.categoryNamecontroller,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (data) {
                            if (data?.isEmpty ?? true) {
                              return "You Must Selected CategoryName ";
                            } else {
                              return null;
                            }
                          },
                          onTap: () {},
                          widget: DropdownButton<String>(
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.categoryNamecontroller.text = newValue!;
                              });
                            },
                            items: List.generate(
                              data.length,
                              (index) => DropdownMenuItem<String>(
                                value: data[index].name,
                                child: Text(
                                  data[index].name,
                                  style:
                                      lightTheme.textTheme.labelMedium!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.myDark,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    validator: (data) {
                      if (data?.isEmpty ?? true) {
                        return "You Must enter ProductName ";
                      } else {
                        return null;
                      }
                    },
                    label: "ProductName",
                    controller: widget.ItemNamecontroller,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must enter priceProduct ";
                        } else {
                          return null;
                        }
                      },
                      label: "priceProduct",
                      controller: widget.priceProdcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must enter Description ";
                        } else {
                          return null;
                        }
                      },
                      label: " Description",
                      controller: widget.Descripcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must enter stockProduct ";
                        } else {
                          return null;
                        }
                      },
                      label: "stockProduct",
                      controller: widget.stockProdcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must enter solditemsProduct ";
                        } else {
                          return null;
                        }
                      },
                      label: "solditemsProduct",
                      controller: widget.solditemsProdcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must enter quantityProduct ";
                        } else {
                          return null;
                        }
                      },
                      label: "quantityProduct",
                      controller: widget.quantityProdcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "You Must enter NameShop ";
                        } else {
                          return null;
                        }
                      },
                      label: "NameShop",
                      controller: widget.nameShopcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                return Row(
                  children: [
                    ProductCubit.get(context).imagepicker!.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(left: 38.0.r),
                            child: GestureDetector(
                              onTap: () {
                                ImagePicker().pickMultiImage().then((value) =>
                                    ProductCubit.get(context)
                                        .uploadimage(value));
                              },
                              child: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(360.r)),
                                  child: Center(
                                      child: Icon(
                                    FontAwesomeIcons.photoFilm,
                                    color: AppColors.myWhite,
                                  ))),
                            ),
                          )
                        : SizedBox(
                            height: 150.h,
                            width: 370,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ProductCubit.get(context)
                                    .imagepicker!
                                    .length,
                                itemBuilder: (context, index) {
                                  var path = ProductCubit.get(context)
                                      .imagepicker![index]
                                      .path;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.file(
                                            width: 150,
                                            height: 120,
                                            fit: BoxFit.fill,
                                            File(path))),
                                  );
                                }),
                          )
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state is UpdateProductIdErrorState) {
                  flutterToast(message: state.errormessage, success: false);
                }
                if (state is UpdateProductIdSuccessState) {
                  flutterToast(
                      message: "The product has been updated successfully",
                      success: true);
                  navigateAndReplacement(
                      context,
                      ProductDetailsScreen(
                        id: widget.id!,
                      ));
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                return CustomButton(
                  title: "update product",
                  isLoading:
                      state is UpdateProductIdLoadingState ? true : false,
                  onTap: () {
                    if (widget.formkey.currentState!.validate()) {
                      int priceProd =
                          int.tryParse(widget.priceProdcontroller.text) ?? 0;
                      int stockProd =
                          int.tryParse(widget.stockProdcontroller.text) ?? 0;
                      int solditemsProd =
                          int.tryParse(widget.solditemsProdcontroller.text) ??
                              0;
                      int quantityProd =
                          int.tryParse(widget.quantityProdcontroller.text) ?? 1;

                      if (quantityProd == 0) {
                        ProductCubit.get(context).updateProductId(
                            id: widget.id!,
                            categoryName: widget.categoryNamecontroller.text,
                            itemName: widget.ItemNamecontroller.text,
                            priceProd: priceProd,
                            descrip: widget.Descripcontroller.text,
                            stockProd: stockProd,
                            solditemsProd: solditemsProd,
                            quantityProd: 1,
                            nameShop: widget.nameShopcontroller.text);
                      } else {
                        ProductCubit.get(context).updateProductId(
                            id: widget.id!,
                            categoryName: widget.categoryNamecontroller.text,
                            itemName: widget.ItemNamecontroller.text,
                            priceProd: priceProd,
                            descrip: widget.Descripcontroller.text,
                            stockProd: stockProd,
                            solditemsProd: solditemsProd,
                            quantityProd: quantityProd,
                            nameShop: widget.nameShopcontroller.text);
                      }
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
