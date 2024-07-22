import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultra_shop/features/product/presentation/widgets/create_product_body.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key, this.nameShop = '', this.screen = ''});
  final String? nameShop;
  final String? screen;
  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  TextEditingController categoryNamecontroller = TextEditingController();
  TextEditingController ItemNamecontroller = TextEditingController();
  TextEditingController priceProdcontroller = TextEditingController();
  TextEditingController Descripcontroller = TextEditingController();
  TextEditingController stockProdcontroller = TextEditingController();
  TextEditingController solditemsProdcontroller = TextEditingController();
  TextEditingController quantityProdcontroller = TextEditingController();
  TextEditingController nameShopcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  String selectedFieldCount = "Smartwatches";
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
    if (widget.nameShop != '') {
      nameShopcontroller.text = widget.nameShop!;
    }
    return SafeArea(
        child: Scaffold(
      body: CreateProductBody(
          formkey: formkey,
          categoryNamecontroller: categoryNamecontroller,
          ItemNamecontroller: ItemNamecontroller,
          priceProdcontroller: priceProdcontroller,
          Descripcontroller: Descripcontroller,
          stockProdcontroller: stockProdcontroller,
          solditemsProdcontroller: solditemsProdcontroller,
          quantityProdcontroller: quantityProdcontroller,
          nameShopcontroller: nameShopcontroller,
          nameShop: widget.nameShop,
          screen: widget.screen),
    ));
  }
}
