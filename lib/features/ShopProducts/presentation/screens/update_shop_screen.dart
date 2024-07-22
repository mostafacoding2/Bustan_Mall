import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/update_shop_body.dart';

class UpdateShopScreen extends StatefulWidget {
  UpdateShopScreen({
    super.key,
    required this.id,
    required this.fileImage,
    required this.name,
    required this.theDoorNumber,
    required this.phoneNumber,
  });
  final int? id;
  final String fileImage;
  final String name;
  final String theDoorNumber;
  final String phoneNumber;
  @override
  State<UpdateShopScreen> createState() => _UpdateShopScreenState();
}

class _UpdateShopScreenState extends State<UpdateShopScreen> {
  TextEditingController NameShopController = TextEditingController();
  TextEditingController theDoorNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  void dispose() {
    NameShopController.dispose();
    theDoorNumberController.dispose();
    phoneNumberController.dispose();
    emailcontroller.dispose();
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

    NameShopController.text = widget.name;
    theDoorNumberController.text = widget.theDoorNumber;
    phoneNumberController.text = widget.phoneNumber;

    return SafeArea(
      child: BlocProvider(
        create: (context) => ShopsCubit(),
        child: BlocConsumer<ShopsCubit, ShopsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
                body: UpdateShopBody(
                    formkey: formkey,
                    NameShopController: NameShopController,
                    theDoorNumberController: theDoorNumberController,
                    phoneNumberController: phoneNumberController,
                    emailcontroller: emailcontroller,
                    widget: widget));
          },
        ),
      ),
    );
  }
}
