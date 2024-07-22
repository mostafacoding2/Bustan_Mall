import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/controller/applyshop_cubit.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/widgets/custom_form_apply_shop.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppliesShopsBody extends StatelessWidget {
  const AppliesShopsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarTitleArrow(title: "Apply Shops",),

        Expanded(
          child: BlocProvider(
            create: (context) => ApplyshopCubit()..getAllApplyShop(),
            child: BlocBuilder<ApplyshopCubit, ApplyShopState>(
              builder: (context, state) {
                var Data=ApplyshopCubit.get(context).appliesShop;
                return state is! AppliesShopsLoadingState
                    ? (ApplyshopCubit.get(context).appliesShop
                    .isNotEmpty)
                    ?  ListView.builder(itemCount: Data.length,
                    itemBuilder: (context,index) {
                      var cubit=Data[index];
                      return CustomFormApplyShop(id:cubit.id,
                          businessName: cubit.businessName!,
                          theDoorNumber: cubit.theDoorNumber!,
                          businessPhone: cubit.businessPhone!,
                          email:cubit.email!,
                          country: cubit.country!,
                          nationalId: cubit.isbn!,
                          userId: cubit.userId!,
                          urlImage: cubit.idPhoto!
                      );
                    }
                ):SizedBox():Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
              },
            ),
          ),
        )
      ],
    );
  }
}