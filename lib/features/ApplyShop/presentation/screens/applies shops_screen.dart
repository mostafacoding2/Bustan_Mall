import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/controller/applyshop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/applies_shops_body.dart';
class AppliesShopsScreen extends StatelessWidget {
  const AppliesShopsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
    return  SafeArea(child: BlocProvider(
  create: (context) => ApplyshopCubit(),
  child: Scaffold(body: AppliesShopsBody(),),
));
  }
}


