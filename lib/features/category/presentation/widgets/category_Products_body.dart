import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/category/presentation/screens/Categories_screen.dart';
import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_product.dart';
import 'package:flutter/material.dart';
class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({
    super.key,
    required this.lenghtList,
    required this.productModel,
  });

  final int? lenghtList;
  final List<ProductModel>? productModel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBarTitleArrow( arrow_back:true,title:"Category Products " ,onpressed:(){navigateTo(context, CategoriesScreen());}),
      lenghtList==0? SizedBox():
      Expanded(
          child:GridView.builder(itemCount:lenghtList ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.9,mainAxisSpacing: 4,crossAxisSpacing: 4,), itemBuilder: (context,index){
                return  CustomProduct(
                    onTap:(){navigateTo(context,
                        ProductDetailsScreen(
                            lenghtList: lenghtList,
                            productModel:productModel,
                            id:productModel![index].id!));},
                    price: "${productModel![index].priceProd}",
                    description: productModel![index].descrip!,
                    urlImage: productModel![index].imageUrls![0],
                    nameDevice: productModel![index].itemName!,
                    rating:productModel![index].averageRate!
                );
              }))
    ],);
  }
}