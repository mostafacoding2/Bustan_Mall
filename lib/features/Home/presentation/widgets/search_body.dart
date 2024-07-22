import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Shimmers/cart.dart';
import '../../../../core/Theme/light_theme.dart';
import '../../../product/data/manger/cubits/product_cubit.dart';
import '../widgets/custom_item_product_search.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
    required this.searchProduct,
  });

  final TextEditingController searchProduct;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBarTitleArrow(arrow_back: true,
            title: "Search ",
            onpressed: () {
              navigateTo(
                  context,
                  BottomNavScreen(
                    currentIndex: 0,
                  ));
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.all(18.0.w),
            child: BlocConsumer<ProductCubit, ProductState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return CustomTextFormField(
              validator: (data) {
                if (data?.isEmpty ?? true) {
                  return "you must enter the value to search";
                } else {
                  return null;
                }
              },
              controller: searchProduct,
              label: "Search ",
              obscureText: false,
              keyboardType: TextInputType.text,onChanged:(va){
              ProductCubit.get(context)
                  .getProductByName(name: searchProduct.text);
            },

            );
  },
),
          ),
          Column(
            children: [
              SizedBox(
                height: 600,
                child: BlocConsumer<ProductCubit, ProductState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var data = ProductCubit.get(context).searchProduct;
                    return state is ! GetProductNameLoadingState?(data.isNotEmpty)?
                    ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var cubit = data[index];
                          return CustomItemProductSearch(
                            onTap:(){navigateTo(context, ProductDetailsScreen(id:cubit.id!,));},
                            price: '${cubit.priceProd}',
                            rating: cubit.averageRate!,
                            urlImage: cubit.imageUrls![0],
                            nameDevice: cubit.itemName!,
                            description: cubit.descrip!,
                          );
                        }):
                   Column(children: [Icon(Icons.search_rounded,color: AppColors.myGrey5,size: 200,),
                     Text("Enter Name product", style: lightTheme.textTheme.titleLarge!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myGrey5,
                    ),)
                   ],): Column(
                     children: [
                       CartShimmer(),
                       SizedBox(height: 20,),
                       CartShimmer(),

                     ],
                   );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
