import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/features/product/presentation/screens/update_product_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_item_delete.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Cart/data/cubit/cart_cubit.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/models/product_model.dart';
import '../screens/review_screen.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody(
      {super.key,
      required this.data,
      this.comming,
      required this.id,
      this.lenghtList});
  final int id;
  final int? lenghtList;
  final ProductModel data;
  final String? comming;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  var controller = PageController();
  int selectedFieldCount = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarTitleArrow(
            arrow_back: true,
            icondata: PopupMenuButton<String>(
                icon: Icon(
                  Icons.menu,
                  color: AppColors.myWhite,
                ),
                onSelected: (String choice) {
                  if (choice == 'Delete') {
                    showDialog(
                        barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
                        context: context,
                        builder: (BuildContext context) {
                          return ItemDelete(
                            id: widget.data.id!,
                            comming: widget.comming,
                            title: "Do you want to delete product ?",
                          );
                        });
                  } else if (choice == 'Update') {
                    navigateTo(
                        context,
                        BlocProvider(
                          create: (context) => ProductCubit(),
                          child: UpDateProductScreen(
                              descrip: widget.data.descrip!,
                              solditemsProd: widget.data.solditemsProd!,
                              quantityProd: widget.data.quantityProd,
                              itemName: widget.data.itemName,
                              priceProd: widget.data.priceProd,
                              id: widget.data.id,
                              categoryName: widget.data.categoryName!,
                              nameShop: widget.data.shop!.name!),
                        ));
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'Delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: AppColors.myRed,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'delete',
                            style: lightTheme.textTheme.labelSmall!.apply(
                              fontSizeFactor: 1.sp,
                              color: AppColors.myRed,
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'Update',
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.edit,
                            color: AppColors.myNavy,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'update',
                            style: lightTheme.textTheme.labelSmall!.apply(
                              fontSizeFactor: 1.sp,
                              color: AppColors.myNavy,
                            ),
                          )
                        ],
                      ),
                    )
                  ];
                }),
            isShowed: role == AppString.admin || role == AppString.seller
                ? true
                : false,
            title: "product details",
            onpressed: () {
              Navigator.pop(context);
            }),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 145.h,
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                  controller: controller,
                  itemCount: widget.data.imageUrls!.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: widget.data.imageUrls![index],
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: AppColors.myRed),
                    );
                  }),
              Positioned(
                  left: 20,
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: AppColors.myYellow,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "${widget.data.averageRate}",
                        textAlign: TextAlign.start,
                        style: lightTheme.textTheme.labelLarge!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myDark,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SmoothPageIndicator(
              controller: controller,
              count: widget.data.imageUrls!.length,
              effect: WormEffect(
                  dotColor: AppColors.myGrey5,
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: AppColors.primaryColor)),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0.r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.data.itemName!,
                        textAlign: TextAlign.center,
                        style: lightTheme.textTheme.labelSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        "quantity:",
                        style: lightTheme.textTheme.labelSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "${widget.data.quantityProd!}",
                        style: lightTheme.textTheme.labelSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myCrimson,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                (role == AppString.seller || role == AppString.admin)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Text(
                                  'category: ',
                                  style: lightTheme.textTheme.labelSmall!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.myNavy,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.data.categoryName!,
                                  style: lightTheme.textTheme.labelSmall!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "  solditemsProduct:",
                                    style:
                                        lightTheme.textTheme.labelSmall!.apply(
                                      fontSizeFactor: 1.sp,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "${widget.data.solditemsProd!}",
                                    style:
                                        lightTheme.textTheme.labelSmall!.apply(
                                      fontSizeFactor: 1.sp,
                                      color: AppColors.myCrimson,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "shop:",
                                      style: lightTheme.textTheme.labelSmall!
                                          .apply(
                                        fontSizeFactor: 1.sp,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "${widget.data.shop!.name!}",
                                      style: lightTheme.textTheme.labelSmall!
                                          .apply(
                                        fontSizeFactor: 1.sp,
                                        color: Colors.purpleAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      )
                    : SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Text(
                        "price:",
                        style: lightTheme.textTheme.labelSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        r" $" " ${widget.data.priceProd!}",
                        style: lightTheme.textTheme.labelSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    " description:  ${widget.data.descrip!}",
                    maxLines: 12,
                    textAlign: TextAlign.start,
                    style: lightTheme.textTheme.labelMedium!.apply(
                      overflow: TextOverflow.ellipsis,
                      fontSizeFactor: 1.sp,
                      color: AppColors.myNavy,
                    ),
                  ),
                ),
                (role == AppString.seller || role == AppString.admin)
                    ? SizedBox(
                        height: 0,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            margin: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.myWhite,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(191, 214, 215, 0.6),
                                      offset: Offset(1, 1),
                                      spreadRadius: 0,
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  "quantity =   ",
                                  style: lightTheme.textTheme.labelSmall!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: Colors.indigo,
                                  ),
                                ),
                                DropdownButton<int>(
                                  dropdownColor: Colors.white,
                                  value: selectedFieldCount,
                                  menuMaxHeight: 300.h,
                                  underline: const SizedBox(),
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      selectedFieldCount = newValue!;
                                    });
                                  },
                                  items: List.generate(
                                    widget.data.quantityProd!,
                                    (index) => DropdownMenuItem<int>(
                                      value: index + 1,
                                      child: Text(
                                        '${index + 1}',
                                        style: lightTheme.textTheme.labelMedium!
                                            .apply(
                                          fontSizeFactor: 1.sp,
                                          color: AppColors.myDark,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0.r, left: 10.r),
                            child: BlocProvider(
                              create: (context) => CartCubit(),
                              child: BlocConsumer<CartCubit, CartState>(
                                listener: (context, state) {
                                  if (state is AddProductToCartSuccessState) {
                                    flutterToast(
                                        message: "Add to Cart Success ",
                                        success: true);
                                  }
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: AppColors.myWhite,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  191, 214, 215, 0.6),
                                              offset: Offset(1, 1),
                                              spreadRadius: 0,
                                              blurRadius: 4)
                                        ]),
                                    child: IconButton(
                                        onPressed: () {
                                          print(widget.data.id.toString());
                                          CartCubit.get(context)
                                              .addProductToCart(
                                                  quantity: selectedFieldCount,
                                                  id: widget.data.id!);
                                        },
                                        icon: Icon(
                                          Icons.shopping_cart,
                                          size: 35,
                                          color: AppColors.myGreen,
                                        )),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    height: 50.h,
                    child: Row(children: [
                      Text(
                        "reviews",
                        style: lightTheme.textTheme.labelLarge!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myCrimson,
                        ),
                      ),
                      Spacer(
                        flex: 9,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateAndReplacement(
                              context, ReviewScreen(id: widget.data.id!));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(360)),
                          child: Icon(
                            Icons.add,
                            size: 28,
                            color: AppColors.myWhite,
                          ),
                        ),
                      ),
                      Spacer(),
                    ])),
                widget.data.revDto.length == 0
                    ? SizedBox()
                    : Expanded(
                        child: ListView.builder(
                            itemCount: widget.data.revDto.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    EdgeInsets.only(right: 10.w, bottom: 5.h),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.myWhite,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(191, 214, 215, 0.1),
                                        offset: Offset(1, 1),
                                        spreadRadius: 0,
                                        blurRadius: 4)
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                      child: Image.asset(
                                          "assets/images/profile.jpeg"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.data.revDto[index].comment!,
                                        style: lightTheme.textTheme.labelMedium!
                                            .apply(
                                          fontSizeFactor: 1.sp,
                                          color: AppColors.myDark,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColors.myYellow,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "${widget.data.revDto[index].rating!}",
                                          textAlign: TextAlign.start,
                                          style: lightTheme
                                              .textTheme.labelSmall!
                                              .apply(
                                            fontSizeFactor: 1.sp,
                                            color: AppColors.myDark,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
