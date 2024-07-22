import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddRoleBody extends StatelessWidget {
  const AddRoleBody({
    super.key,
    required this.userNameController,
    required this.roleNameController,
    required this.fromkey,
  });

  final TextEditingController userNameController;
  final TextEditingController roleNameController;
  final GlobalKey<FormState> fromkey;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBarTitleArrow(icondata: null,
            onpressed: () {
              navigateTo(
                  context,
                  BottomNavScreen(
                    currentIndex: 3,
                  ));
            },
            title: "Add Role"),
        SizedBox(height: 30.h,),
        Padding(
          padding: EdgeInsets.only(
              top: 18.0.r,
              left: 18.0.r,
              right: 18.0.r,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              CustomTextFormField(
                validator: (data) {
                  if (data?.isEmpty ?? true) {
                    return "You Must Enter userName ";
                  } else {
                    return null;
                  }
                },
                controller:userNameController ,
                obscureText: false,
                keyboardType: TextInputType.text,
                label: "userName",
              ),
              SizedBox(height: 30.h,),
              CustomTextFormField(
                validator: (data) {
                  if (data?.isEmpty ?? true) {
                    return "You Must Enter nameRole ";
                  } else {
                    return null;
                  }
                },
                controller:roleNameController ,
                obscureText: false,
                keyboardType: TextInputType.text,
                label: "nameRole",
              ),

              SizedBox(
                height: 50.h,
              ),
              BlocProvider(
                create: (context) => AccountCubit(),
                child: BlocConsumer<AccountCubit, AccountState>(
                  listener: (context,state){
                    if(state is AddRoleSuccessState){
                      flutterToast(message: "Success Add Role", success: true);
                      navigateTo(context, BottomNavScreen(currentIndex: 3,));   }
                    if(state is AddRoleErrorState){
                      flutterToast(message: state.errormessage, success: false);
                    }
                  },
                  builder: (context, state) {

                    return CustomButton(
                      isLoading: state is AddRoleLoadingState?true:false,
                      title: "Add Role"
                      ,
                      onTap: () {
                        if(fromkey.currentState!.validate()){
                          AccountCubit.get(context).addRole(userName: userNameController.text, roleName: roleNameController.text);

                        }
                      },
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
