import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ultra_shop/features/product/presentation/widgets/update_product_body.dart';
class UpDateProductScreen extends StatefulWidget {
   UpDateProductScreen({super.key, required this.categoryName,required this.id,  required this.nameShop,
   required this.itemName,
   required this.priceProd,
   required this.descrip,
   required this.solditemsProd,
   required this.quantityProd,
   });
  String ?categoryName;
   int ?id;
   String ?nameShop;
  String? itemName;
  int? priceProd;
 String?  descrip;
  int ?solditemsProd;
  int? quantityProd;

  @override
  State<UpDateProductScreen> createState() => _UpDateProductScreenState();
}
class _UpDateProductScreenState extends State<UpDateProductScreen> {
  TextEditingController categoryNamecontroller=TextEditingController();
  TextEditingController ItemNamecontroller=TextEditingController();
  TextEditingController priceProdcontroller=TextEditingController();
  TextEditingController Descripcontroller=TextEditingController();
  TextEditingController stockProdcontroller=TextEditingController();
  TextEditingController solditemsProdcontroller=TextEditingController();
  TextEditingController quantityProdcontroller=TextEditingController();
  TextEditingController nameShopcontroller=TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey();
  String   selectedFieldCount ="Smartwatches";
  @override
  void dispose() {
    categoryNamecontroller.dispose();
    ItemNamecontroller.dispose();
    priceProdcontroller.dispose();
    Descripcontroller.dispose();
    stockProdcontroller.dispose();
    solditemsProdcontroller.dispose();
    quantityProdcontroller.dispose();
    nameShopcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    nameShopcontroller.text=widget.nameShop!;
    solditemsProdcontroller.text="${widget.solditemsProd!}";
    quantityProdcontroller.text= "${widget.quantityProd!}";
    Descripcontroller.text=widget.descrip!;
    ItemNamecontroller.text=widget.itemName!;
    priceProdcontroller.text="${widget.priceProd!}";
    return  SafeArea(
      child: Scaffold(
        body:     UpdateProductBody(categoryName: widget.categoryName, id: widget.id, nameShop: widget.nameShop, itemName: widget.itemName, priceProd: widget.priceProd, descrip: widget.descrip, solditemsProd: widget.solditemsProd, quantityProd: widget.quantityProd, categoryNamecontroller: categoryNamecontroller, ItemNamecontroller: ItemNamecontroller, priceProdcontroller: priceProdcontroller, Descripcontroller: Descripcontroller, stockProdcontroller: stockProdcontroller, solditemsProdcontroller: solditemsProdcontroller, quantityProdcontroller: quantityProdcontroller, nameShopcontroller: nameShopcontroller, formkey: formkey)

      ),
    );
  }
}
